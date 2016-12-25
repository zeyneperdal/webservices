(:Find 6! By using a recursive function.:)

xquery version "1.0";

declare function local:fact($a as xs:integer) {
    if ($a eq 1) then
        $a
    else
        $a * local:fact($a - 1)
};
local:fact(5)
(: Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" useresolver="yes" url="" outputurl="" processortype="saxon" tcpport="0" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline=""
		          additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" host="" port="1482780088" user="" password="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProperties name="bSchemaAware" value="true"/>
			<advancedProperties name="CollectionURIResolver" value=""/>
			<advancedProperties name="ModuleURIResolver" value=""/>
			<advancedProperties name="schemaCache" value="||"/>
			<advancedProperties name="bXml11" value="false"/>
			<advancedProperties name="bUseDTD" value="false"/>
			<advancedProperties name="bWarnings" value="true"/>
			<advancedProperties name="iWhitespace" value="0"/>
			<advancedProperties name="DocumentURIResolver" value=""/>
			<advancedProperties name="bTinyTree" value="true"/>
			<advancedProperties name="bGenerateByteCode" value="true"/>
			<advancedProperties name="iValidation" value="0"/>
			<advancedProperties name="bExtensions" value="true"/>
			<advancedProperties name="xQueryVersion" value="1.0"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
:)