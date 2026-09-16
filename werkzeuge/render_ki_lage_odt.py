#!/usr/bin/env python3
"""Render a weekly KI-Lage Markdown file as a Collabora-compatible ODT."""

from datetime import datetime, timezone
from html import escape
from pathlib import Path
from zipfile import ZIP_DEFLATED, ZIP_STORED, ZipFile
import re
import shutil
import sys

NS = 'xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0"'
STYLES = f'''<?xml version="1.0" encoding="UTF-8"?>
<office:document-styles {NS} office:version="1.3"><office:styles>
<style:default-style style:family="paragraph"><style:paragraph-properties fo:line-height="145%"/><style:text-properties style:font-name="Liberation Sans" fo:font-size="11pt" fo:color="#263238"/></style:default-style>
<style:style style:name="Title" style:family="paragraph"><style:paragraph-properties fo:margin-bottom="0.35cm"/><style:text-properties fo:font-size="25pt" fo:font-weight="bold" fo:color="#501B73"/></style:style>
<style:style style:name="Subtitle" style:family="paragraph"><style:paragraph-properties fo:margin-bottom="0.7cm"/><style:text-properties fo:font-size="13pt" fo:color="#59636A"/></style:style>
<style:style style:name="Body" style:family="paragraph"><style:paragraph-properties fo:margin-bottom="0.28cm"/></style:style>
<style:style style:name="Footer" style:family="paragraph"><style:paragraph-properties fo:margin-top="0.7cm" fo:border-top="0.03cm solid #C8CDD0" fo:padding-top="0.25cm"/><style:text-properties fo:font-size="9pt" fo:color="#69757B"/></style:style>
<style:style style:name="Link" style:family="text"><style:text-properties fo:color="#501B73" style:text-underline-style="solid"/></style:style>
<style:style style:name="Strong" style:family="text"><style:text-properties fo:font-weight="bold"/></style:style>
<text:list-style style:name="List"><text:list-level-style-bullet text:level="1" text:bullet-char="•"><style:list-level-properties text:space-before="0.6cm" text:min-label-width="0.5cm"/><style:text-properties fo:color="#EF5B00"/></text:list-level-style-bullet></text:list-style>
</office:styles><office:automatic-styles><style:page-layout style:name="pm1"><style:page-layout-properties fo:page-width="21cm" fo:page-height="29.7cm" fo:margin="1.9cm"/></style:page-layout></office:automatic-styles><office:master-styles><style:master-page style:name="Standard" style:page-layout-name="pm1"/></office:master-styles></office:document-styles>'''
MANIFEST = '''<?xml version="1.0" encoding="UTF-8"?><manifest:manifest xmlns:manifest="urn:oasis:names:tc:opendocument:xmlns:manifest:1.0" manifest:version="1.3"><manifest:file-entry manifest:full-path="/" manifest:media-type="application/vnd.oasis.opendocument.text" manifest:version="1.3"/><manifest:file-entry manifest:full-path="content.xml" manifest:media-type="text/xml"/><manifest:file-entry manifest:full-path="styles.xml" manifest:media-type="text/xml"/><manifest:file-entry manifest:full-path="meta.xml" manifest:media-type="text/xml"/></manifest:manifest>'''


def inline(markdown: str) -> str:
    out, pos = [], 0
    token = re.compile(r'\*\*(.+?)\*\*|\[([^]]+)\]\((https?://[^)]+)\)')
    for match in token.finditer(markdown):
        out.append(escape(markdown[pos:match.start()]))
        if match.group(1) is not None:
            out.append(f'<text:span text:style-name="Strong">{escape(match.group(1))}</text:span>')
        else:
            out.append(f'<text:a text:style-name="Link" xlink:type="simple" xlink:href="{escape(match.group(3), quote=True)}" xlink:show="new" xlink:actuate="onRequest" office:target-frame-name="_blank">{escape(match.group(2))}</text:a>')
        pos = match.end()
    out.append(escape(markdown[pos:]))
    return ''.join(out)


def render(source: Path, destination: Path) -> None:
    lines = source.read_text(encoding='utf-8').splitlines()
    title = lines[0].removeprefix('# ').strip()
    date = source.stem
    body, items = [], []
    for line in lines[1:]:
        if line.startswith('- '):
            items.append(f'<text:list-item><text:p text:style-name="Body">{inline(line[2:])}</text:p></text:list-item>')
        elif line.strip():
            if items:
                body.append('<text:list text:style-name="List">' + ''.join(items) + '</text:list>')
                items = []
            body.append(f'<text:p text:style-name="Footer">{inline(line)}</text:p>')
    if items:
        body.append('<text:list text:style-name="List">' + ''.join(items) + '</text:list>')
    content = f'''<?xml version="1.0" encoding="UTF-8"?><office:document-content {NS} office:version="1.3"><office:body><office:text><text:p text:style-name="Title">Automagia-KI-News</text:p><text:p text:style-name="Subtitle">{escape(title)} · {escape(date)}</text:p>{''.join(body)}</office:text></office:body></office:document-content>'''
    now = datetime.now(timezone.utc).replace(microsecond=0).isoformat().replace('+00:00', 'Z')
    meta = f'''<?xml version="1.0" encoding="UTF-8"?><office:document-meta {NS} office:version="1.3"><office:meta><dc:title>{escape(title)}</dc:title><dc:creator>Gandalf</dc:creator><dc:description>Wöchentliches KI-Kurzbriefing für Automagia</dc:description><meta:creation-date>{now}</meta:creation-date></office:meta></office:document-meta>'''
    destination.parent.mkdir(parents=True, exist_ok=True)
    with ZipFile(destination, 'w') as archive:
        archive.writestr('mimetype', 'application/vnd.oasis.opendocument.text', compress_type=ZIP_STORED)
        archive.writestr('content.xml', content, compress_type=ZIP_DEFLATED)
        archive.writestr('styles.xml', STYLES, compress_type=ZIP_DEFLATED)
        archive.writestr('meta.xml', meta, compress_type=ZIP_DEFLATED)
        archive.writestr('META-INF/manifest.xml', MANIFEST, compress_type=ZIP_DEFLATED)


if __name__ == '__main__':
    if len(sys.argv) != 4:
        raise SystemExit('usage: render_ki_lage_odt.py SOURCE.md REPO_OUTPUT.odt NEXTCLOUD_OUTPUT.odt')
    source, repo_output, cloud_output = map(Path, sys.argv[1:])
    render(source, repo_output)
    cloud_output.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(repo_output, cloud_output)
