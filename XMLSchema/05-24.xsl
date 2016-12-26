<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<fo:root>

<!-- ** XML2e ** -->
<!-- to follow the book's example, see the section below -->
			<!-- overall layout -->
			<fo:layout-master-set>
				<fo:simple-page-master master-name="wonders_cover" page-width="8.5in" page-height="11in" margin="1in">
					<fo:region-body/>
				</fo:simple-page-master>
			
				<fo:simple-page-master master-name="wonders" page-width="8.5in" page-height="11in">
					<fo:region-body margin="1in" column-count="2"/>
					<fo:region-before extent="1in"/>
					<fo:region-after extent="1in"/>
				</fo:simple-page-master>
			</fo:layout-master-set>

			<!-- page content -->
			<fo:page-sequence master-reference="wonders_cover">
				<fo:flow flow-name="xsl-region-body">
					<fo:block font-size="28pt" text-align="center">
						Seven Wonders of the Ancient World</fo:block>
					<fo:block space-before="0.25in" text-align="center">
						<fo:external-graphic src="url('herodotus.jpg')" border-style="ridge" content-height="3.5in"/>
					</fo:block>
					<fo:block font-size="14pt" text-align="justify" space-before="0.25in">The famous Greek historian Herodotus wrote of seven great architectural achievements. And although his writings did not survive, he planted seeds for what has become the list of the <fo:inline font-weight="bold">Seven Wonders of the Ancient World</fo:inline>.</fo:block>
					<fo:block font-size="10pt" text-align="center" space-before="3.5in">
						Submitted by: Kevin Howard Goldberg
					</fo:block>
				</fo:flow>
			</fo:page-sequence>

			<fo:page-sequence master-reference="wonders">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block font-size="18pt" text-align="center" border-bottom-width="medium" border-bottom-style="solid" margin="0.25in">Seven Wonders of the Ancient World</fo:block>
				</fo:static-content>

				<fo:static-content flow-name="xsl-region-after">
					<fo:block font-size="9pt" text-align="right" margin="0.5in" margin-top="0.25in">
						Page <fo:page-number/>
					</fo:block>
				</fo:static-content>

				<fo:flow flow-name="xsl-region-body">
					<xsl:apply-templates select="ancient_wonders/wonder/name[@language='English']">
						<xsl:sort select="." order="ascending"/>
					</xsl:apply-templates>
				</fo:flow>
			</fo:page-sequence>

		</fo:root>
	</xsl:template>

	<xsl:template match="name">
		<fo:block span="all" margin-bottom="0.2in">
			<fo:block font-size="24pt" text-align="center" break-before="page">
				<xsl:value-of select="."/>
			</fo:block>
			<fo:block text-align="center">
				<fo:external-graphic content-height="3.5in" border-style="ridge" border-width="thick">
					<xsl:attribute name="src">url(&quot;<xsl:value-of select="../main_image/@file"/>&quot;)</xsl:attribute>
				</fo:external-graphic>
			</fo:block>
		</fo:block>

		<fo:block font-size="14pt" text-align="justify">
			<xsl:if test="position()!=last()">
				<xsl:attribute name="break-after">column</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="../history/story"/>
		</fo:block>

	</xsl:template>

	<xsl:template match="story">
		<xsl:for-each select="text()">
			<fo:block space-after="0.1in">
				<xsl:value-of select="."/>
			</fo:block>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
