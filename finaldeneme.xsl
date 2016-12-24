<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>FÜZE DENEMESİ</title>
			</head>
			<body>
				<br />
				<b>Sadece döviz kodu yazımı: </b>
				<xsl:for-each select="Currencies/Currency">
					<xsl:value-of select="@CurrencyCode" />
					<xsl:if test="not(position() = last())">, </xsl:if>
				</xsl:for-each><br />
				
				<hr />
				<b>CrossOrder &lt; 4: </b>
				<xsl:for-each select="Currencies/Currency">
					<xsl:if test="@CrossOrder &lt; 4">
						<xsl:value-of select="Name" />
						<xsl:if test="not(position() = last()-12)">, </xsl:if>
					</xsl:if>
				</xsl:for-each><br />
				
				<hr />
				<b>İngilizce isimleri: </b>
				<xsl:for-each select="Currencies/Currency">
					<xsl:value-of select="Name[@Lang = 'en']" />
					
					<xsl:choose>
						<xsl:when test="position() = last()-1">
							and
						</xsl:when>
						<xsl:when test="position() = last()">
							.
						</xsl:when>
						<xsl:otherwise>
							,
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each><br />
				
				<hr />
				<b>İsme göre A dan Z ye sıralanmış: </b><br />
				<xsl:for-each select="Currencies/Currency">
				<xsl:sort select="Name[@lang = 'tr']" order="ascending" data-type="text" />
					<xsl:value-of select="ForexBuying" /> - <xsl:value-of select="Name[@Lang = 'tr']" /><br />
				</xsl:for-each><br />
				
				<hr />
				<b>XSL Attribute etiketi ile link yapma: </b>
				<a>
					<xsl:attribute name="href">
						#<xsl:value-of select="Currencies/Currency[@CrossOrder='1']/@CurrencyCode" />
					</xsl:attribute>
					<xsl:attribute name="title">English: <xsl:value-of select="Currencies/Currency[@CrossOrder='1']/Name[@Lang = 'en']" />
					</xsl:attribute>
					<xsl:value-of select="Currencies/Currency[@CrossOrder='1']/Name[@Lang = 'tr']" />
				</a><br />
				
				<hr />
				<b>Kodlara template uygulama(alış değeri 1 TL den düşük olanları işaretleyelim.s): </b>-
				<xsl:for-each select="Currencies/Currency">
					<xsl:if test="ForexBuying &lt; 1">
						<xsl:apply-templates select="@Kod" /> -
					</xsl:if> 
					<xsl:if test="ForexBuying &gt; 1">
						<xsl:value-of select="@Kod" /> -
					</xsl:if> 
				</xsl:for-each><br />
				
				<hr />
				<b>Tek bir içeriğe template uygulama: </b>-
				<xsl:apply-templates select="Currencies/Currency[position()=3]/Name[@Lang='en']" /><br />
				
				<hr />
				<b>Son Düğümün bütün çocuk düğümleri: </b>
				<xsl:value-of select="Currencies/*[position()=last()]" /><br />
				
				<hr />
				<b>Son Düğümden bir önceki düğümün bütün çocuk düğümleri: </b>
				<xsl:value-of select="Currencies/*[position()=last()-1]" /><br />
				
				<hr />
				<b>2. Düğümün ebeveyninin sahip olduğu 3. düğümün, Name'i: </b>
				<xsl:value-of select="Currencies/Currency[position()=2]/../Currency[position()=3]/Name" /><br />
				
				<hr />
				<b>2. Düğümün ForexSelling düğümünün, ebeveyninin ebeveynini hangi ingilizce isme sahiptir?: </b>
				<xsl:value-of select="Currencies/Currency[position()=2]/ForexSelling/../../Currency[position()=last()]/Name[@Lang = 'en']" /><br />
				
				<hr />
				<b>7. Düğümün, Name'inin BanknoteSelling sibling'i: </b>
				<xsl:value-of select="Currencies/Currency[position()=7]/Name/../BanknoteSelling" /><br />
				
				<hr />
				<b>İlk name düğümünün ebeveyninin Kod attribute'ü ve satış değeri: </b>
				<xsl:value-of select="Currencies/Currency/Name/../@Kod" /> - 
				<xsl:value-of select="Currencies/Currency[position()=7]/Name/../BanknoteSelling" /><br />
				
				<hr />
				<b>Son düğümün bütün attribute'leri: </b><br />
				<xsl:for-each select="Currencies/Currency[last()]/@*">
					<xsl:value-of select="." /><br />
				</xsl:for-each><br />
				
				<hr />
				<b>Son düğümün bütün attribute'lerinin ismi ve değeri: </b><br />
				<xsl:for-each select="Currencies/Currency[last()]/@*">
					<xsl:value-of select="name(.)" />: <xsl:value-of select="." /><br />
				</xsl:for-each><br />
				
				<hr />
				<b>Çin Yuanı(16.) düğümünün türkçe ismine, absolute adres ile erişme: </b><br />
				<xsl:value-of select="/Currencies/Currency[@CrossOrder='16']/Name[@Lang='tr']" /><br />
				
				<hr />
				<b>Bütün torun düğümlerin  düğüm isimlerini satır satır yazdırmak: </b><br />
				<xsl:for-each select="//*">
					<xsl:if test="name(.) = 'Currency'">
						<br />
					</xsl:if> 
					<xsl:if test="not(position() = 1) and not(name(.) = 'Currency')">
						<xsl:value-of select="name(.)" />, 
					</xsl:if> 
				</xsl:for-each><br />
				
				<hr />
				<b>Bütün torun düğümlerden @State att sahip olanları: </b><br />
				<xsl:for-each select="//*/@State">
					<xsl:value-of select="." /><br />
				</xsl:for-each><br />
				
				<hr />
				<b>Bütün Unit isimli düğümlerin kardeş düğümleri: </b><br />
				<xsl:for-each select="//Unit">
					<xsl:value-of select=".." /><br />
				</xsl:for-each><br />
				
				<hr />
				<b>Satış fiyatı 2 den büyük, 5 ten küçük olanları isimleriyle beraber tablo halinde, azalan sıralı: </b><br />
				<table border="1">
				<tr>
					<td>İsim</td>
					<td>Satış</td>
				</tr>
				<xsl:for-each select="Currencies/Currency[BanknoteSelling &gt; 2][BanknoteSelling &lt; 5]">
				<xsl:sort select="./BanknoteSelling" order="descending" data-type="number" />
					<tr>
						<td><xsl:value-of select="./Name" /></td>
						<td><xsl:value-of select="./BanknoteSelling" /></td>
					</tr>
				</xsl:for-each>
				</table><br />
				
				<hr />
				<b>Dizi deklarasyonu ile 4. düğümün 3. çocuğunu xml formatında görüntüleme: </b><br />
				&lt;<xsl:value-of select="name(Currencies/Currency[4]/*[3])" />&#160;<xsl:value-of select="name(Currencies/Currency[4]/*[3]/@*)" />='<xsl:value-of select="Currencies/Currency[4]/*[3]/@*" />'&gt;<xsl:value-of select="Currencies/Currency[4]/*[3]" />&lt;<xsl:value-of select="name(Currencies/Currency[4]/*[3])" />&gt;<br />
				
				<hr />
				<b>Doların normal ve foreks alış-satış farkı: </b><br />
				Normal: <xsl:value-of select="Currencies/Currency[1]/BanknoteSelling - Currencies/Currency[1]/BanknoteBuying" /><br />
				Foreks: <xsl:value-of select="Currencies/Currency[1]/ForexSelling - Currencies/Currency[1]/ForexBuying" /><br />
				
				<hr />
				<b>1 Dolar normal alış fiyatına göre kaç TL?: </b><br />
				1 USD = : <xsl:value-of select="1 div Currencies/Currency[1]/BanknoteSelling" /> TL<br />
				
				<hr />
				<b>Bütün döviz tiplerinin sayısı: </b>
				<xsl:value-of select="count(Currencies/Currency)" /><br />
				
				<hr />
				<b>birimi 100 olan bütün döviz tiplerinin sayısı: </b>
				<xsl:value-of select="count(Currencies/Currency[Unit = 100])" /><br />
				
				<hr />
				<b>Satış fiyatlarını #,##0.00 formatıyla gösterme: </b><br />
				
				<xsl:for-each select="Currencies/Currency">
					<xsl:value-of select="format-number(./BanknoteSelling, '#,##0.00')" /> - 
				</xsl:for-each><br />
				
				<hr />
				<b>Round, Ceiling ve Floor fonksiyonları ile tablo çizimi: </b><br />
				
				<table border="1">
				<thead>
					<tr>
						<th>Fonksiyon</th>
						<xsl:for-each select="Currencies/Currency">
							<th><xsl:value-of select="@CurrencyCode" /></th> 
						</xsl:for-each>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>Round</th>
						<xsl:for-each select="Currencies/Currency">
							<td><xsl:value-of select="round(./ForexSelling)" /></td>
						</xsl:for-each>
					</tr>
					<tr>
						<th>Ceiling</th>
						<xsl:for-each select="Currencies/Currency">
							<td><xsl:value-of select="ceiling(./ForexSelling)" /></td>
						</xsl:for-each>
					</tr>
					<tr>
						<th>Floor</th>
						<xsl:for-each select="Currencies/Currency">
							<td><xsl:value-of select="floor(./ForexSelling)" /></td>
						</xsl:for-each>
					</tr>
				</tbody>
				</table>
				
				<hr />
				<b>16. düğüm için  str fonksiyonlar: </b><br />
				substring-before boşluk: <xsl:value-of select="substring-before(/Currencies/Currency[@CrossOrder='16']/Name[@Lang='tr'], ' ')" /><br />
				substring-after boşluk: <xsl:value-of select="substring-after(/Currencies/Currency[@CrossOrder='16']/Name[@Lang='tr'], ' ')" /><br />
				substring 2 den itibaren 2 karakter: <xsl:value-of select="substring(/Currencies/Currency[@CrossOrder='16']/Name[@Lang='tr'],2,2)" /><br />
				translate büyükten-küçüğe: <xsl:value-of select="translate(/Currencies/Currency[@CrossOrder='16']/Name[@Lang='tr'],'ÇİNYUANI','çinyuanı')" /><br />
				
				<hr />
				<b>Bütün ForexBuying in ortalaması: </b><br />
				<xsl:value-of select="sum(/Currencies/Currency/ForexBuying) div count(/Currencies/Currency/ForexBuying)" /><br />
				
				<hr />
				<b>Diğer Fonksiyonlar: </b><br />
				name düğüm ismi: <xsl:value-of select="name(/Currencies/Currency/ForexBuying)" /><br />
				contains: <xsl:value-of select="contains(/Currencies/Currency/Name, substring-after(/Currencies/Currency/Name, ' '))" /><br />
				string-length: <xsl:value-of select="string-length(/Currencies/Currency/Name)" /><br />
				
				<hr />
				<hr />
				<hr />
				<center><h1></h1></center>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="@Kod">
		<i style="color: #bf1e2e">
			<xsl:value-of select="." />
		</i>
	</xsl:template>
	
	<xsl:template match="Currency[position()=3]/Name[@Lang='en']">
		<b style="color: #bf1e2e">
			<xsl:value-of select="." />
		</b>
	</xsl:template>
	
</xsl:stylesheet>
