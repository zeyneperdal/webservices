(: input :)
xquery version "1.0";
  
  doc("vize_denemeler.xml")
    /Currencies/Currency/Name
    [contains(.,"DOLARI")]
(: output
<Name Lang="tr">ABD DOLARI</Name>
<Name Lang="tr">AVUSTRALYA DOLARI</Name>
<Name Lang="tr">KANADA DOLARI</Name> :)
(: ------------------------------------------------------------------------------------------- :)

(: input :)
xquery version "1.0";
  
  doc("vize_denemeler.xml")
    /Currencies/Currency/Name
    [contains(../Unit,"100")]
(: output
<Name Lang="tr">JAPON YENİ</Name>
<Name Lang="en">JAPENESE YEN</Name>
<Name Lang="tr">İRAN RİYALİ</Name>
<Name Lang="en">IRANIAN RIAL</Name> :)
(: ------------------------------------------------------------------------------------------- :)

(: input :)
xquery version "1.0";
  
  for $cur in
    doc("vize_denemeler.xml")
      /Currencies/Currency
  where
      contains($cur/Unit,"100")
  return
      $cur
(: output
<Currency CrossOrder="5" Kod="JPY" CurrencyCode="JPY">
  <Unit>100</Unit>
  <Name Lang="tr">JAPON YENİ</Name>
  <Name Lang="en">JAPENESE YEN</Name>
  <ForexBuying>2.3326</ForexBuying>
  <ForexSelling>2.3481</ForexSelling>
  <BanknoteBuying>2.324</BanknoteBuying>
  <BanknoteSelling>2.357</BanknoteSelling>
  <CrossRateUSD>122.68</CrossRateUSD>
</Currency>
<Currency CrossOrder="15" Kod="IRR" CurrencyCode="IRR">
  <Unit>100</Unit>
  <Name Lang="tr">İRAN RİYALİ</Name>
  <Name Lang="en">IRANIAN RIAL</Name>
  <ForexBuying>0.00952</ForexBuying>
  <ForexSelling>0.00964</ForexSelling>
  <CrossRateUSD>29964</CrossRateUSD>
</Currency> :)

(: ------------------------------------------------------------------------------------------- :)

(: input :)
xquery version "1.0";
  
  for $cur in
    doc("vize_denemeler.xml")
      /Currencies/Currency
  where
      contains($cur/Unit,"1")
  return
      $cur/Name[@Lang="tr"]
(: output
<Name Lang="tr">ABD DOLARI</Name>
<Name Lang="tr">AVUSTRALYA DOLARI</Name>
<Name Lang="tr">DANİMARKA KRONU</Name>
<Name Lang="tr">İNGİLİZ STERLİNİ</Name>
<Name Lang="tr">İSVİÇRE FRANGI</Name>
<Name Lang="tr">İSVEÇ KRONU</Name>
<Name Lang="tr">KANADA DOLARI</Name>
<Name Lang="tr">KUVEYT DİNARI</Name>
<Name Lang="tr">NORVEÇ KRONU</Name>
<Name Lang="tr">SUUDİ ARABİSTAN RİYALİ</Name>
<Name Lang="tr">JAPON YENİ</Name>
<Name Lang="tr">BULGAR LEVASI</Name>
<Name Lang="tr">RUMEN LEYİ</Name>
<Name Lang="tr">RUS RUBLESİ</Name>
<Name Lang="tr">İRAN RİYALİ</Name>
<Name Lang="tr">ÇİN YUANI</Name>
<Name Lang="tr">PAKİSTAN RUPİSİ</Name> :)

(: ------------------------------------------------------------------------------------------- :)

(: input :)
xquery version "1.0";
  
  for $cur in
    doc("vize_denemeler.xml")
      /Currencies/Currency
  where
      contains($cur/Unit,"1")
  order by
    $cur/Name[@Lang="tr"]
  return
    $cur/Name[@Lang="tr"]
(: output
<Name Lang="tr">ABD DOLARI</Name>
<Name Lang="tr">AVUSTRALYA DOLARI</Name>
<Name Lang="tr">BULGAR LEVASI</Name>
<Name Lang="tr">DANİMARKA KRONU</Name>
<Name Lang="tr">JAPON YENİ</Name>
<Name Lang="tr">KANADA DOLARI</Name>
<Name Lang="tr">KUVEYT DİNARI</Name>
<Name Lang="tr">NORVEÇ KRONU</Name>
<Name Lang="tr">PAKİSTAN RUPİSİ</Name>
<Name Lang="tr">RUMEN LEYİ</Name>
<Name Lang="tr">RUS RUBLESİ</Name>
<Name Lang="tr">SUUDİ ARABİSTAN RİYALİ</Name>
<Name Lang="tr">ÇİN YUANI</Name>
<Name Lang="tr">İNGİLİZ STERLİNİ</Name>
<Name Lang="tr">İRAN RİYALİ</Name>
<Name Lang="tr">İSVEÇ KRONU</Name>
<Name Lang="tr">İSVİÇRE FRANGI</Name> :)

(: ------------------------------------------------------------------------------------------- :)

(: input :)
xquery version "1.0";
  
  for $cur in
    doc("vize_denemeler.xml")
      /Currencies/Currency
  let $fbuying := $cur/ForexBuying
  let $fselling := $cur/ForexSelling
  where
      contains($cur/Unit,"100")
  order by
    $cur/Name[@Lang="tr"]
  return
    ($cur/Name[@Lang="tr"],$fbuying,$fselling)
(: output
<Name Lang="tr">JAPON YENİ</Name>
<ForexBuying>2.3326</ForexBuying>
<ForexSelling>2.3481</ForexSelling>
<Name Lang="tr">İRAN RİYALİ</Name>
<ForexBuying>0.00952</ForexBuying>
<ForexSelling>0.00964</ForexSelling> :)

(: ------------------------------------------------------------------------------------------- :)
(: input :)
xquery version "1.0";
  <info>{
    for $cur in
      doc("vize_denemeler.xml")
        /Currencies/Currency
    return
      if($cur/CrossRateUSD > "5") then
        <HighCrossRateUSD>
        {data($cur/Name[@Lang="tr"])}
        </HighCrossRateUSD>
      else if($cur/CrossRateUSD < "5") then
        <LowCrossRateUSD>
        {data($cur/Name[@Lang="tr"])}
        </LowCrossRateUSD>
      else()
  }</info>
(: output
<info>
  <LowCrossRateUSD>ABD DOLARI</LowCrossRateUSD>
  <LowCrossRateUSD>AVUSTRALYA DOLARI</LowCrossRateUSD>
  <HighCrossRateUSD>DANİMARKA KRONU</HighCrossRateUSD>
  <LowCrossRateUSD>İNGİLİZ STERLİNİ</LowCrossRateUSD>
  <LowCrossRateUSD>İSVİÇRE FRANGI</LowCrossRateUSD>
  <HighCrossRateUSD>İSVEÇ KRONU</HighCrossRateUSD>
  <LowCrossRateUSD>KANADA DOLARI</LowCrossRateUSD>
  <LowCrossRateUSD>KUVEYT DİNARI</LowCrossRateUSD>
  <HighCrossRateUSD>NORVEÇ KRONU</HighCrossRateUSD>
  <LowCrossRateUSD>SUUDİ ARABİSTAN RİYALİ</LowCrossRateUSD>
  <LowCrossRateUSD>JAPON YENİ</LowCrossRateUSD>
  <LowCrossRateUSD>BULGAR LEVASI</LowCrossRateUSD>
  <LowCrossRateUSD>RUMEN LEYİ</LowCrossRateUSD>
  <HighCrossRateUSD>RUS RUBLESİ</HighCrossRateUSD>
  <LowCrossRateUSD>İRAN RİYALİ</LowCrossRateUSD>
  <HighCrossRateUSD>ÇİN YUANI</HighCrossRateUSD>
  <LowCrossRateUSD>PAKİSTAN RUPİSİ</LowCrossRateUSD>
</info> :)

(: ------------------------------------------------------------------------------------------- :)
(: input :)
xquery version "1.0";

    for $cur in
      doc("vize_denemeler.xml")
        /Currencies/Currency
    
    for $book in
      doc("ProjectXML/ProjectXML/catalog.xml")
        /catalog/book
        
    where
      $cur/@CurrencyCode = $book/price/@currency
      
    return
      (data($book/title),data($cur/Name[@Lang="tr"]))
(: output
XML Developer's Guide
ABD DOLARI :)

(: ------------------------------------------------------------------------------------------- :)
(: input :)
xquery version "1.0";

  declare function local:fark($CCode)
  as xs:double
  {
    
    for $kur in
      doc("vize_denemeler.xml")
      /Currencies/Currency
      
    let $alis := (data($kur/ForexBuying))
    let $satis := (data($kur/ForexSelling))
    let $fark as xs:double := $satis - $alis
    
    where $kur/@Kod = $CCode
    
    return $fark
    
  };
  
  for $cur in
    doc("vize_denemeler.xml")
      /Currencies/Currency
  where $cur/@Kod = "USD"
  return
    local:fark($cur/@Kod)
(: output
0.00520000000000032 :)
