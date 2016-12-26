<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<fo:root>
			<!-- overall layout -->
			<fo:layout-master-set>
				<fo:simple-page-master master-name="wonders" page-width="8.5in" page-height="11in">
					<fo:region-body margin="1in"/>
					<fo:region-before extent="1in"/>
				</fo:simple-page-master>
			</fo:layout-master-set>

			<!-- page content -->
			<fo:page-sequence master-reference="wonders">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block font-size="18pt" text-align="center" border-bottom-width="medium" border-bottom-style="solid" margin=".25in">Seven Wonders of the Ancient World</fo:block>
				</fo:static-content>

<!-- ** XML2e ** -->
<!-- to follow the book's example, see the section below -->
				<fo:flow flow-name="xsl-region-body">
					<xsl:apply-templates select="ancient_wonders/wonder/name[@language='English']">
						<xsl:sort select="." order="ascending"/>
					</xsl:apply-templates>
				</fo:flow>
			</fo:page-sequence>

		</fo:root>
	</xsl:template>

	<xsl:template match="name">
		<fo:block font-size="24pt" text-align="center" space-after="0.2in">
			<xsl:value-of select="."/>
		</fo:block>
		<fo:block text-align="center" space-after="0.2in">
			<fo:external-graphic content-height="3.5in" border-style="ridge" border-width="thick">
				<xsl:attribute name="src">url(&quot;<xsl:value-of select="../main_image/@file"/>&quot;)</xsl:attribute>
			</fo:external-graphic>
		</fo:block>
		<fo:block font-size="14pt">
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
