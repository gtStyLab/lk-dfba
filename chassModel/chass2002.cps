<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.14 (Build 89) (http://www.copasi.org) at 2017-02-09 00:33:03 UTC -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="14" versionDevel="89" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_7" name="Constant flux (reversible)" type="PreDefined" reversible="true">
      <Expression>
        v
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_47" name="v" order="0" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_45" name="Function for Transaldolase" type="UserDefined" reversible="true">
      <Expression>
        rmaxTA*(cgap*csed7p-ce4p*cf6p/KTAeq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_325" name="KTAeq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_317" name="ce4p" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_321" name="cf6p" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_309" name="cgap" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_313" name="csed7p" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_305" name="rmaxTA" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_46" name="Function for Transketolase a" type="UserDefined" reversible="true">
      <Expression>
        rmaxTKa*(crib5p*cxyl5p-csed7p*cgap/KTKaeq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_303" name="KTKaeq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_319" name="cgap" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_289" name="crib5p" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_311" name="csed7p" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_295" name="cxyl5p" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_326" name="rmaxTKa" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_47" name="Function for Transketolase b" type="UserDefined" reversible="true">
      <Expression>
        rmaxTKb*(cxyl5p*ce4p-cf6p*cgap/KTKbeq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_327" name="KTKbeq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_286" name="ce4p" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_330" name="cf6p" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_328" name="cgap" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_315" name="cxyl5p" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_332" name="rmaxTKb" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_48" name="Function for Aldolase" type="UserDefined" reversible="true">
      <Expression>
        rmaxALDO*(cfdp-cgap*cdhap/kALDOeq)/(kALDOfdp+cfdp+kALDOgap*cdhap/(kALDOeq*VALDOblf)+kALDOdhap*cgap/(kALDOeq*VALDOblf)+cfdp*cgap/kALDOgapinh+cgap*cdhap/(VALDOblf*kALDOeq))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_333" name="VALDOblf" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_346" name="cdhap" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_340" name="cfdp" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_338" name="cgap" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_336" name="kALDOdhap" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_344" name="kALDOeq" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_323" name="kALDOfdp" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_329" name="kALDOgap" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_334" name="kALDOgapinh" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_342" name="rmaxALDO" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_51" name="Function for Glycerol-3-phosphate dehydrogenase" type="UserDefined" reversible="true">
      <Expression>
        rmaxG3PDH*cdhap/(KG3PDHdhap+cdhap)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_359" name="KG3PDHdhap" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_337" name="cdhap" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_351" name="rmaxG3PDH" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_53" name="Function for Serine synthesis" type="UserDefined" reversible="true">
      <Expression>
        rmaxSerSynth*cpg3/(KSerSynthpg3+cpg3)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_376" name="KSerSynthpg3" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_372" name="cpg3" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_368" name="rmaxSerSynth" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_58" name="Function for Synthesis 1" type="UserDefined" reversible="true">
      <Expression>
        rmaxSynth1*cpep/(KSynth1pep+cpep)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_370" name="KSynth1pep" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_393" name="cpep" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_401" name="rmaxSynth1" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_59" name="Function for Synthesis 2" type="UserDefined" reversible="true">
      <Expression>
        rmaxSynth2*cpyr/(KSynth2pyr+cpyr)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_405" name="KSynth2pyr" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_389" name="cpyr" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_408" name="rmaxSynth2" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_60" name="Function for DAHP synthesis" type="UserDefined" reversible="true">
      <Expression>
        rmaxDAHPS*ce4p^nDAHPSe4p*cpep^nDAHPSpep/((KDAHPSe4p+ce4p^nDAHPSe4p)*(KDAHPSpep+cpep^nDAHPSpep))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_409" name="KDAHPSe4p" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_415" name="KDAHPSpep" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_411" name="ce4p" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_413" name="cpep" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_397" name="nDAHPSe4p" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_419" name="nDAHPSpep" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_417" name="rmaxDAHPS" order="6" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_61" name="Function for Pyruvate dehydrogenase" type="UserDefined" reversible="true">
      <Expression>
        rmaxPDH*cpyr^nPDH/(KPDHpyr+cpyr^nPDH)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_420" name="KPDHpyr" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_412" name="cpyr" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_416" name="nPDH" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_385" name="rmaxPDH" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_63" name="Function for Ribose-phosphate isomerase" type="UserDefined" reversible="true">
      <Expression>
        rmaxR5PI*(cribu5p-crib5p/KR5PIeq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_435" name="KR5PIeq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_431" name="crib5p" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_427" name="cribu5p" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_423" name="rmaxR5PI" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_64" name="Function for Ribulose-phosphate epimerase" type="UserDefined" reversible="true">
      <Expression>
        rmaxRu5P*(cribu5p-cxyl5p/KRu5Peq)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_418" name="KRu5Peq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_410" name="cribu5p" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_429" name="cxyl5p" order="2" role="product"/>
        <ParameterDescription key="FunctionParameter_437" name="rmaxRu5P" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_65" name="Function for Ribose phosphate pyrophosphokinase" type="UserDefined" reversible="true">
      <Expression>
        rmaxRPPK*crib5p/(KRPPKrib5p+crib5p)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_438" name="KRPPKrib5p" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_433" name="crib5p" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_439" name="rmaxRPPK" order="2" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_67" name="Function for G6P degradation" type="UserDefined" reversible="true">
      <Expression>
        mu*cg6p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_453" name="cg6p" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_449" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_68" name="Function for F6P degradation" type="UserDefined" reversible="true">
      <Expression>
        mu*cf6p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_447" name="cf6p" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_445" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_69" name="Function for FDP degradation" type="UserDefined" reversible="true">
      <Expression>
        mu*cfdp
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_443" name="cfdp" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_441" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_70" name="Function for GAP degradation" type="UserDefined" reversible="true">
      <Expression>
        mu*cgap
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_425" name="cgap" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_454" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_71" name="Function for DHAP degradation" type="UserDefined" reversible="true">
      <Expression>
        mu*cdhap
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_455" name="cdhap" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_456" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_72" name="Function for PGP degradation" type="UserDefined" reversible="true">
      <Expression>
        mu*cpgp
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_457" name="cpgp" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_458" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_73" name="Function for PG3 degradation" type="UserDefined" reversible="true">
      <Expression>
        mu*cpg3
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_459" name="cpg3" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_460" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_74" name="Function for PG2 degradation" type="UserDefined" reversible="true">
      <Expression>
        mu*cpg2
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_461" name="cpg2" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_462" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_75" name="Function for PEP degradation" type="UserDefined" reversible="true">
      <Expression>
        mu*cpep
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_463" name="cpep" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_464" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_76" name="Function for Ribu5P dilution" type="UserDefined" reversible="true">
      <Expression>
        mu*cribu5p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_465" name="cribu5p" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_466" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_77" name="Function for Rib5P dilution" type="UserDefined" reversible="true">
      <Expression>
        mu*crib5p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_467" name="crib5p" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_468" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_78" name="Function for XYL5P dilution" type="UserDefined" reversible="true">
      <Expression>
        mu*cxyl5p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_469" name="cxyl5p" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_470" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_79" name="Function for SED7P dilution" type="UserDefined" reversible="true">
      <Expression>
        mu*csed7p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_471" name="csed7p" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_472" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_80" name="Function for Pyruvate dilution" type="UserDefined" reversible="true">
      <Expression>
        mu*cpyr
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_473" name="cpyr" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_474" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_81" name="Function for PG dilution" type="UserDefined" reversible="true">
      <Expression>
        mu*cpg
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_475" name="cpg" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_476" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_82" name="Function for E4P dilution" type="UserDefined" reversible="true">
      <Expression>
        mu*ce4p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_477" name="ce4p" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_478" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_83" name="Function for GLP dilution" type="UserDefined" reversible="true">
      <Expression>
        mu*cg1p
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_479" name="cg1p" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_480" name="mu" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_84" name="Function for Extracellular glucose kinetics" type="UserDefined" reversible="true">
      <Expression>
        Dil*(cfeed-cglcex)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_484" name="Dil" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_482" name="cfeed" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_481" name="cglcex" order="2" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_85" name="Function for Phosphotransferase system_1" type="UserDefined" reversible="true">
      <Expression>
        extracellular*rmaxPTS*cglcex*(cpep/cpyr)/((KPTSa1+KPTSa2*(cpep/cpyr)+KPTSa3*cglcex+cglcex*(cpep/cpyr))*(1+cg6p^nPTSg6p/KPTSg6p))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_720" name="KPTSa1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_721" name="KPTSa2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_722" name="KPTSa3" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_723" name="KPTSg6p" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_724" name="cg6p" order="4" role="product"/>
        <ParameterDescription key="FunctionParameter_725" name="cglcex" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_726" name="cpep" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_727" name="cpyr" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_728" name="extracellular" order="8" role="volume"/>
        <ParameterDescription key="FunctionParameter_729" name="nPTSg6p" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_730" name="rmaxPTS" order="10" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_86" name="Function for Glucose-6-phosphate isomerase_1" type="UserDefined" reversible="true">
      <Expression>
        rmaxPGI*(cg6p-cf6p/KPGIeq)/(KPGIg6p*(1+cf6p/(KPGIf6p*(1+cpg/KPGIf6ppginh))+cpg/KPGIg6ppginh)+cg6p)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_715" name="KPGIeq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_714" name="KPGIf6p" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_742" name="KPGIf6ppginh" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_743" name="KPGIg6p" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_744" name="KPGIg6ppginh" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_745" name="cf6p" order="5" role="product"/>
        <ParameterDescription key="FunctionParameter_746" name="cg6p" order="6" role="substrate"/>
        <ParameterDescription key="FunctionParameter_747" name="cpg" order="7" role="modifier"/>
        <ParameterDescription key="FunctionParameter_748" name="rmaxPGI" order="8" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_87" name="Function for Phosphoglucomutase_1" type="UserDefined" reversible="true">
      <Expression>
        rmaxPGM*(cg6p-cg1p/KPGMeq)/(KPGMg6p*(1+cg1p/KPGMg1p)+cg6p)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_719" name="KPGMeq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_711" name="KPGMg1p" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_713" name="KPGMg6p" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_758" name="cg1p" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_759" name="cg6p" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_760" name="rmaxPGM" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_88" name="Function for Glucose-6-phosphate dehydrogenase_1" type="UserDefined" reversible="unspecified">
      <Expression>
        rmaxG6PDH*cg6p*cnadp/((cg6p+KG6PDHg6p)*(1+cnadph/KG6PDHnadphg6pinh)*(KG6PDHnadp*(1+cnadph/KG6PDHnadphnadpinh)+cnadp))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_769" name="KG6PDHg6p" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_770" name="KG6PDHnadp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_771" name="KG6PDHnadphg6pinh" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_772" name="KG6PDHnadphnadpinh" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_773" name="cg6p" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_774" name="cnadp" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_775" name="cnadph" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_776" name="rmaxG6PDH" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_89" name="Function for Phosphofructokinase_1" type="UserDefined" reversible="unspecified">
      <Expression>
        rmaxPFK*catp*cf6p/((catp+KPFKatps*(1+cadp/KPFKadpc))*(cf6p+KPFKf6ps*(1+cpep/KPFKpep+cadp/KPFKadpb+camp/KPFKampb)/(1+cadp/KPFKadpa+camp/KPFKampa))*(1+LPFK/(1+cf6p*(1+cadp/KPFKadpa+camp/KPFKampa)/(KPFKf6ps*(1+cpep/KPFKpep+cadp/KPFKadpb+camp/KPFKampb)))^nPFK))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_793" name="KPFKadpa" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_794" name="KPFKadpb" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_795" name="KPFKadpc" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_796" name="KPFKampa" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_797" name="KPFKampb" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_798" name="KPFKatps" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_799" name="KPFKf6ps" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_800" name="KPFKpep" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_801" name="LPFK" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_802" name="cadp" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_803" name="camp" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_804" name="catp" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_805" name="cf6p" order="12" role="substrate"/>
        <ParameterDescription key="FunctionParameter_806" name="cpep" order="13" role="modifier"/>
        <ParameterDescription key="FunctionParameter_807" name="nPFK" order="14" role="constant"/>
        <ParameterDescription key="FunctionParameter_808" name="rmaxPFK" order="15" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_90" name="Function for Glyceraldehyde-3-phosphate dehydrogenase_1" type="UserDefined" reversible="true">
      <Expression>
        rmaxGAPDH*(cgap*cnad-cpgp*cnadh/KGAPDHeq)/((KGAPDHgap*(1+cpgp/KGAPDHpgp)+cgap)*(KGAPDHnad*(1+cnadh/KGAPDHnadh)+cnad))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_791" name="KGAPDHeq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_712" name="KGAPDHgap" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_718" name="KGAPDHnad" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_787" name="KGAPDHnadh" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_788" name="KGAPDHpgp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_792" name="cgap" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_785" name="cnad" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_717" name="cnadh" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_767" name="cpgp" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_716" name="rmaxGAPDH" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_91" name="Function for Triosephosphate isomerase_1" type="UserDefined" reversible="true">
      <Expression>
        rmaxTIS*(cdhap-cgap/kTISeq)/(kTISdhap*(1+cgap/kTISgap)+cdhap)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_710" name="cdhap" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_839" name="cgap" order="1" role="product"/>
        <ParameterDescription key="FunctionParameter_841" name="kTISdhap" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_842" name="kTISeq" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_868" name="kTISgap" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_869" name="rmaxTIS" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_92" name="Function for Phosphoglycerate kinase_1" type="UserDefined" reversible="true">
      <Expression>
        rmaxPGK*(cadp*cpgp-catp*cpg3/KPGKeq)/((KPGKadp*(1+catp/KPGKatp)+cadp)*(KPGKpgp*(1+cpg3/KPGKpg3)+cpgp))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_884" name="KPGKadp" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_885" name="KPGKatp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_886" name="KPGKeq" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_887" name="KPGKpg3" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_888" name="KPGKpgp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_889" name="cadp" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_890" name="catp" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_891" name="cpg3" order="7" role="product"/>
        <ParameterDescription key="FunctionParameter_892" name="cpgp" order="8" role="substrate"/>
        <ParameterDescription key="FunctionParameter_893" name="rmaxPGK" order="9" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_93" name="Function for Phosphoglycerate mutase_1" type="UserDefined" reversible="true">
      <Expression>
        rmaxPGluMu*(cpg3-cpg2/KPGluMueq)/(KPGluMupg3*(1+cpg2/KPGluMupg2)+cpg3)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_880" name="KPGluMueq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_904" name="KPGluMupg2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_905" name="KPGluMupg3" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_906" name="cpg2" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_907" name="cpg3" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_908" name="rmaxPGluMu" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_94" name="Function for Enolase_1" type="UserDefined" reversible="true">
      <Expression>
        rmaxENO*(cpg2-cpep/KENOeq)/(KENOpg2*(1+cpep/KENOpep)+cpg2)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_915" name="KENOeq" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_916" name="KENOpep" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_917" name="KENOpg2" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_918" name="cpep" order="3" role="product"/>
        <ParameterDescription key="FunctionParameter_919" name="cpg2" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_920" name="rmaxENO" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_95" name="Function for Pyruvate kinase_1" type="UserDefined" reversible="unspecified">
      <Expression>
        rmaxPK*cpep*(cpep/KPKpep+1)^(nPK-1)*cadp/(KPKpep*(LPK*((1+catp/KPKatp)/(cfdp/KPKfdp+camp/KPKamp+1))^nPK+(cpep/KPKpep+1)^nPK)*(cadp+KPKadp))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_934" name="KPKadp" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_935" name="KPKamp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_936" name="KPKatp" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_937" name="KPKfdp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_938" name="KPKpep" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_939" name="LPK" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_940" name="cadp" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_941" name="camp" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_942" name="catp" order="8" role="constant"/>
        <ParameterDescription key="FunctionParameter_943" name="cfdp" order="9" role="modifier"/>
        <ParameterDescription key="FunctionParameter_944" name="cpep" order="10" role="substrate"/>
        <ParameterDescription key="FunctionParameter_945" name="nPK" order="11" role="constant"/>
        <ParameterDescription key="FunctionParameter_946" name="rmaxPK" order="12" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_96" name="Function for PEP carboxylase_1" type="UserDefined" reversible="true">
      <Expression>
        rmaxpepCxylase*cpep*(1+(cfdp/KpepCxylasefdp)^npepCxylasefdp)/(KpepCxylasepep+cpep)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_876" name="KpepCxylasefdp" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_843" name="KpepCxylasepep" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_840" name="cfdp" order="2" role="modifier"/>
        <ParameterDescription key="FunctionParameter_930" name="cpep" order="3" role="substrate"/>
        <ParameterDescription key="FunctionParameter_928" name="npepCxylasefdp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_932" name="rmaxpepCxylase" order="5" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_97" name="Function for 6-Phosphogluconate dehydrogenase_1" type="UserDefined" reversible="unspecified">
      <Expression>
        rmaxPGDH*cpg*cnadp/((cpg+KPGDHpg)*(cnadp+KPGDHnadp*(1+cnadph/KPGDHnadphinh)*(1+catp/KPGDHatpinh)))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_986" name="KPGDHatpinh" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_987" name="KPGDHnadp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_988" name="KPGDHnadphinh" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_989" name="KPGDHpg" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_990" name="catp" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_991" name="cnadp" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_992" name="cnadph" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_993" name="cpg" order="7" role="substrate"/>
        <ParameterDescription key="FunctionParameter_994" name="rmaxPGDH" order="8" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_98" name="Function for Glucose-1-phosphate adenyltransferase_1" type="UserDefined" reversible="true">
      <Expression>
        rmaxG1PAT*cg1p*catp*(1+(cfdp/KG1PATfdp)^nG1PATfdp)/((KG1PATatp+catp)*(KG1PATg1p+cg1p))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_1014" name="KG1PATatp" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_1015" name="KG1PATfdp" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_1016" name="KG1PATg1p" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_1017" name="catp" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_1018" name="cfdp" order="4" role="modifier"/>
        <ParameterDescription key="FunctionParameter_1019" name="cg1p" order="5" role="substrate"/>
        <ParameterDescription key="FunctionParameter_1020" name="nG1PATfdp" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_1021" name="rmaxG1PAT" order="7" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_4" name="Chassagnole2002_Carbon_Metabolism" simulationType="time" timeUnit="s" volumeUnit="l" areaUnit="m²" lengthUnit="m" quantityUnit="mmol" type="deterministic" avogadroConstant="6.02214179e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:vCard="http://www.w3.org/2001/vcard-rdf/3.0#">
  <rdf:Description rdf:about="#Model_4">
    <dcterms:bibliographicCitation>
      <rdf:Bag>
        <rdf:li>
          <rdf:Description>
            <CopasiMT:isDescribedBy rdf:resource="http://identifiers.org/pubmed/17590932"/>
          </rdf:Description>
        </rdf:li>
      </rdf:Bag>
    </dcterms:bibliographicCitation>
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2006-01-18T22:51:54Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <dcterms:creator>
      <rdf:Bag>
        <rdf:li>
          <rdf:Description>
            <vCard:EMAIL>jls@sun.ac.za</vCard:EMAIL>
            <vCard:N>
              <rdf:Description>
                <vCard:Family>Snoep</vCard:Family>
                <vCard:Given>Jacky L</vCard:Given>
              </rdf:Description>
            </vCard:N>
            <vCard:ORG>
              <rdf:Description>
                <vCard:Orgname>Stellenbosh University</vCard:Orgname>
              </rdf:Description>
            </vCard:ORG>
          </rdf:Description>
        </rdf:li>
        <rdf:li>
          <rdf:Description>
            <vCard:EMAIL>hdharuri@cds.caltech.edu</vCard:EMAIL>
            <vCard:N>
              <rdf:Description>
                <vCard:Family>Dharuri</vCard:Family>
                <vCard:Given>Harish</vCard:Given>
              </rdf:Description>
            </vCard:N>
            <vCard:ORG>
              <rdf:Description>
                <vCard:Orgname>California Institute of Technology</vCard:Orgname>
              </rdf:Description>
            </vCard:ORG>
          </rdf:Description>
        </rdf:li>
      </rdf:Bag>
    </dcterms:creator>
    <dcterms:modified>
      <rdf:Description>
        <dcterms:W3CDTF>2012-08-01T17:37:58Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:modified>
    <CopasiMT:hasPart>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.pathway/map00010"/>
        <rdf:li rdf:resource="http://identifiers.org/kegg.pathway/map00030"/>
      </rdf:Bag>
    </CopasiMT:hasPart>
    <CopasiMT:hasPart>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0006096"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0006098"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0009401"/>
      </rdf:Bag>
    </CopasiMT:hasPart>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/biomodels.db/MODEL6624119661"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/biomodels.db/BIOMD0000000051"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:occursIn>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/taxonomy/562"/>
      </rdf:Bag>
    </CopasiMT:occursIn>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <Comment>
      
  <body xmlns="http://www.w3.org/1999/xhtml">
    <p align="left">The model reproduces Figures 4,5 and 6 of the publication. The analytical functions for cometabolites Catp, Camp, Cnadph,  and Cnadp slightly differ from the equations given in the paper. These changes were made in consultation with Dr. Christophe Chassagnole and are essential for reproducing the figures.  The dependency of the rate of change of extracellular glucose concentration on the ratio of biomass concentration to specific weight of biomass (Cx*rPTS/Rhox) is taken into account by appropriately adjusting the stoichiometries of the species involved in the phosphotransferase system  (rPTS). The rmax values for the various reactions are obtained from experiments and are not provided in the paper. However, these were personally communicated to the JWS repository. The model has been successfully tested on MathSBML.</p>
    <p align="left">
      <font face="Arial, Helvetica, sans-serif">
        <b>
          <a href="http://www.sbml.org/">SBML</a>
              level 2 code generated for the JWS Online project by Jacky Snoep using          <a href="http://pysces.sourceforge.net/">PySCeS</a>
          <br/>
              Run this model online at          <a href="http://jjj.biochem.sun.ac.za/">http://jjj.biochem.sun.ac.za</a>
          <br/>
              To cite JWS Online please refer to: Olivier, B.G. and Snoep, J.L. (2004)          <a href="http://bioinformatics.oupjournals.org/cgi/content/abstract/20/13/2143">Web-based 
modelling using JWS Online</a>
              , Bioinformatics, 20:2143-2144          </b>
      </font>
    </p>
    <br/>
    <p>To the extent possible under law, all copyright and related or neighbouring rights to this encoded model have been dedicated to the public domain worldwide. Please refer to      <a href="http://creativecommons.org/publicdomain/zero/1.0/" title="Creative Commons CC0">CC0 Public Domain Dedication</a>
          for more information.      </p>
  <p>In summary, you are entitled to use this encoded model in absolutely any manner you deem suitable, verbatim, or with modification, alone or embedded it in a larger context, redistribute it, commercially or not, in a restricted way or not.</p>
  <br/>
  <p>To cite BioModels Database, please use:      <a href="http://www.ncbi.nlm.nih.gov/pubmed/20587024" target="_blank">Li C, Donizelli M, Rodriguez N, Dharuri H, Endler L, Chelliah V, Li L, He E, Henry A, Stefan MI, Snoep JL, Hucka M, Le Novère N, Laibe C (2010) BioModels Database: An enhanced, curated and annotated resource for published quantitative kinetic models. BMC Syst Biol., 4:92.</a>
</p>
</body>

    </Comment>
    <ListOfCompartments>
      <Compartment key="Compartment_5" name="extracellular" simulationType="fixed" dimensionality="3">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_5">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0005576"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Compartment>
      <Compartment key="Compartment_7" name="cytosol" simulationType="fixed" dimensionality="3">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_7">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0005829"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_39" name="Extracellular Glucose" simulationType="reactions" compartment="Compartment_5">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_39">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:31:10Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:4167"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00031"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00293"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:17234"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_37" name="Phosphoenol pyruvate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_37">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:32:19Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00074"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:18021"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_41" name="Glucose-6-Phosphate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_41">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:32:14Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00668"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:17665"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_43" name="Pyruvate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_43">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:32:21Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00022"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:15361"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_45" name="Fructose-6-Phosphate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_45">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:31:20Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C05345"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00085"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:15946"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_47" name="Glucose-1-Phosphate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_47">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:31:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00103"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:16077"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_49" name="6-Phosphogluconate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_49">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:31:06Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00345"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:16863"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_51" name="Fructose-1,6-bisphosphate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_51">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:31:18Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00354"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:16905"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_53" name="sedoheptulose-7-phosphate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_53">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:32:31Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00281"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:15721"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_55" name="Glyceraldehyde-3-Phosphate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_55">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:32:17Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00661"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:17138"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_57" name="Erythrose-4-phosphate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_57">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:31:09Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:48153"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00279"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_59" name="Xylulose-5-phosphate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_59">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:32:39Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00231"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:16332"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_61" name="Ribose-5-phosphate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_61">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:32:29Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00117"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:17797"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_63" name="Dihydroxyacetonephosphate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_63">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:31:08Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00111"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:16108"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_65" name="1,3-diphosphosphoglycerate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_65">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:30:44Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00236"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:16001"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_67" name="3-Phosphoglycerate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_67">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:31:04Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00197"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:17794"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_69" name="2-Phosphoglycerate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_69">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:31:03Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00631"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:17835"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_71" name="Ribulose-5-phosphate" simulationType="reactions" compartment="Compartment_7">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_71">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2017-02-08T19:32:31Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.compound/C00199"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.chebi/CHEBI:17363"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </Metabolite>
    </ListOfMetabolites>
    <ListOfModelValues>
      <ModelValue key="ModelValue_7" name="catp" simulationType="assignment">
        <Expression>
          4.27-4.163*(&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;/(0.657+1.43*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;+0.0364*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;^2))
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_8" name="cadp" simulationType="assignment">
        <Expression>
          0.582+1.73*2.731^(-0.15*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;)*(0.12*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;+0.000214*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;^3)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_9" name="camp" simulationType="assignment">
        <Expression>
          0.123+7.25*(&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;/(7.25+1.47*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;+0.17*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;^2))+1.073/(1.29+8.05*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_10" name="cnadp" simulationType="assignment">
        <Expression>
          0.159-0.00554*(&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;/(2.8-0.271*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;+0.01*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;^2))+0.182/(4.82+0.526*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_11" name="cnadph" simulationType="assignment">
        <Expression>
          0.062+0.332*2.718^(-0.464*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;)*(0.0166*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;^1.58+0.000166*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;^4.73+0.1312*10^(-9)*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;^7.89+0.1362*10^(-12)*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;^11+0.1233*10^(-15)*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;^14.2)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_12" name="cnad" simulationType="assignment">
        <Expression>
          1.314+1.314*2.73^(-0.0435*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;-0.342)-(&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;+7.871)*(2.73^(-0.0218*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;-0.171)/(8.481+&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;))
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_13" name="cnadh" simulationType="assignment">
        <Expression>
          0.0934+0.00111*2.371^(-0.123*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;)*(0.844*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;+0.104*&lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time&gt;^3)
        </Expression>
      </ModelValue>
    </ListOfModelValues>
    <ListOfReactions>
      <Reaction key="Reaction_48" name="Phosphotransferase system" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_48">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.pathway/eco02060"/>
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_39" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_37" stoichiometry="65"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_41" stoichiometry="65"/>
          <Product metabolite="Metabolite_43" stoichiometry="65"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1622" name="rmaxPTS" value="7829.78"/>
          <Constant key="Parameter_1623" name="KPTSa1" value="3082.3"/>
          <Constant key="Parameter_1624" name="KPTSa2" value="0.01"/>
          <Constant key="Parameter_1625" name="KPTSa3" value="245.3"/>
          <Constant key="Parameter_1626" name="nPTSg6p" value="3.66"/>
          <Constant key="Parameter_1627" name="KPTSg6p" value="2.15"/>
        </ListOfConstants>
        <KineticLaw function="Function_85">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_720">
              <SourceParameter reference="Parameter_1623"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_721">
              <SourceParameter reference="Parameter_1624"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_722">
              <SourceParameter reference="Parameter_1625"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_723">
              <SourceParameter reference="Parameter_1627"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_724">
              <SourceParameter reference="Metabolite_41"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_725">
              <SourceParameter reference="Metabolite_39"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_726">
              <SourceParameter reference="Metabolite_37"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_727">
              <SourceParameter reference="Metabolite_43"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_728">
              <SourceParameter reference="Compartment_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_729">
              <SourceParameter reference="Parameter_1626"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_730">
              <SourceParameter reference="Parameter_1622"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_49" name="Glucose-6-phosphate isomerase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_49">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R00771"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_1255"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/5.3.1.9"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0004347"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_41" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_45" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_49" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_1628" name="rmaxPGI" value="650.988"/>
          <Constant key="Parameter_1629" name="KPGIeq" value="0.1725"/>
          <Constant key="Parameter_1630" name="KPGIg6p" value="2.9"/>
          <Constant key="Parameter_1631" name="KPGIf6p" value="0.266"/>
          <Constant key="Parameter_1632" name="KPGIf6ppginh" value="0.2"/>
          <Constant key="Parameter_1633" name="KPGIg6ppginh" value="0.2"/>
        </ListOfConstants>
        <KineticLaw function="Function_86">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_715">
              <SourceParameter reference="Parameter_1629"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_714">
              <SourceParameter reference="Parameter_1631"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_742">
              <SourceParameter reference="Parameter_1632"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_743">
              <SourceParameter reference="Parameter_1630"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_744">
              <SourceParameter reference="Parameter_1633"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_745">
              <SourceParameter reference="Metabolite_45"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_746">
              <SourceParameter reference="Metabolite_41"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_747">
              <SourceParameter reference="Metabolite_49"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_748">
              <SourceParameter reference="Parameter_1628"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_50" name="Phosphoglucomutase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_50">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R00959"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_605"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/5.4.2.2"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_41" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_47" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1634" name="rmaxPGM" value="0.839824"/>
          <Constant key="Parameter_1635" name="KPGMeq" value="0.196"/>
          <Constant key="Parameter_1636" name="KPGMg6p" value="1.038"/>
          <Constant key="Parameter_1637" name="KPGMg1p" value="0.0136"/>
        </ListOfConstants>
        <KineticLaw function="Function_87">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_719">
              <SourceParameter reference="Parameter_1635"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_711">
              <SourceParameter reference="Parameter_1637"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_713">
              <SourceParameter reference="Parameter_1636"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_758">
              <SourceParameter reference="Metabolite_47"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_759">
              <SourceParameter reference="Metabolite_41"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_760">
              <SourceParameter reference="Parameter_1634"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_51" name="Glucose-6-phosphate dehydrogenase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_51">
    <CopasiMT:hasPart>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R00835"/>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R02035"/>
      </rdf:Bag>
    </CopasiMT:hasPart>
    <CopasiMT:hasPart>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/1.1.1.49"/>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/3.1.1.31"/>
      </rdf:Bag>
    </CopasiMT:hasPart>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_41" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_49" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1638" name="rmaxG6PDH" value="1.3802"/>
          <Constant key="Parameter_1639" name="KG6PDHg6p" value="14.4"/>
          <Constant key="Parameter_1640" name="KG6PDHnadphg6pinh" value="6.43"/>
          <Constant key="Parameter_1641" name="KG6PDHnadp" value="0.0246"/>
          <Constant key="Parameter_1642" name="KG6PDHnadphnadpinh" value="0.01"/>
          <Constant key="Parameter_1643" name="cnadp" value="0.196759"/>
          <Constant key="Parameter_1644" name="cnadph" value="0.062"/>
        </ListOfConstants>
        <KineticLaw function="Function_88">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_769">
              <SourceParameter reference="Parameter_1639"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_770">
              <SourceParameter reference="Parameter_1641"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_771">
              <SourceParameter reference="Parameter_1640"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_772">
              <SourceParameter reference="Parameter_1642"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_773">
              <SourceParameter reference="Metabolite_41"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_774">
              <SourceParameter reference="ModelValue_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_775">
              <SourceParameter reference="ModelValue_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_776">
              <SourceParameter reference="Parameter_1638"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_52" name="Phosphofructokinase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_52">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R00756"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_736"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/2.7.1.11"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_45" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_51" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_37" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_1645" name="rmaxPFK" value="1840.58"/>
          <Constant key="Parameter_1646" name="KPFKatps" value="0.123"/>
          <Constant key="Parameter_1647" name="KPFKadpc" value="4.14"/>
          <Constant key="Parameter_1648" name="KPFKf6ps" value="0.325"/>
          <Constant key="Parameter_1649" name="KPFKpep" value="3.26"/>
          <Constant key="Parameter_1650" name="KPFKadpb" value="3.89"/>
          <Constant key="Parameter_1653" name="KPFKampb" value="3.2"/>
          <Constant key="Parameter_1652" name="KPFKadpa" value="128"/>
          <Constant key="Parameter_1654" name="KPFKampa" value="19.1"/>
          <Constant key="Parameter_1651" name="LPFK" value="5.62907e+06"/>
          <Constant key="Parameter_1655" name="nPFK" value="11.1"/>
          <Constant key="Parameter_1656" name="cadp" value="0.582"/>
          <Constant key="Parameter_1657" name="camp" value="0.954783"/>
          <Constant key="Parameter_1658" name="catp" value="4.27"/>
        </ListOfConstants>
        <KineticLaw function="Function_89">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_793">
              <SourceParameter reference="Parameter_1652"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_794">
              <SourceParameter reference="Parameter_1650"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_795">
              <SourceParameter reference="Parameter_1647"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_796">
              <SourceParameter reference="Parameter_1654"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_797">
              <SourceParameter reference="Parameter_1653"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_798">
              <SourceParameter reference="Parameter_1646"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_799">
              <SourceParameter reference="Parameter_1648"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_800">
              <SourceParameter reference="Parameter_1649"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_801">
              <SourceParameter reference="Parameter_1651"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_802">
              <SourceParameter reference="ModelValue_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_803">
              <SourceParameter reference="ModelValue_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_804">
              <SourceParameter reference="ModelValue_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_805">
              <SourceParameter reference="Metabolite_45"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_806">
              <SourceParameter reference="Metabolite_37"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_807">
              <SourceParameter reference="Parameter_1655"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_808">
              <SourceParameter reference="Parameter_1645"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_53" name="Transaldolase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_53">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R01827"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_1272"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/2.2.1.2"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_55" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_53" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_45" stoichiometry="1"/>
          <Product metabolite="Metabolite_57" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1659" name="rmaxTA" value="10.8716"/>
          <Constant key="Parameter_1660" name="KTAeq" value="1.05"/>
        </ListOfConstants>
        <KineticLaw function="Function_45">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_325">
              <SourceParameter reference="Parameter_1660"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_317">
              <SourceParameter reference="Metabolite_57"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_321">
              <SourceParameter reference="Metabolite_45"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_309">
              <SourceParameter reference="Metabolite_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_313">
              <SourceParameter reference="Metabolite_53"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_305">
              <SourceParameter reference="Parameter_1659"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_54" name="Transketolase a" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_54">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R01641"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_162"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/2.2.1.1"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_61" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_59" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_55" stoichiometry="1"/>
          <Product metabolite="Metabolite_53" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1661" name="rmaxTKa" value="9.47338"/>
          <Constant key="Parameter_1662" name="KTKaeq" value="1.2"/>
        </ListOfConstants>
        <KineticLaw function="Function_46">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_303">
              <SourceParameter reference="Parameter_1662"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_319">
              <SourceParameter reference="Metabolite_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_289">
              <SourceParameter reference="Metabolite_61"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_311">
              <SourceParameter reference="Metabolite_53"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_295">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_326">
              <SourceParameter reference="Parameter_1661"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_55" name="Transketolase b" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_55">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R01067"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_1811"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/2.2.1.1"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_57" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_59" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_55" stoichiometry="1"/>
          <Product metabolite="Metabolite_45" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1663" name="rmaxTKb" value="86.5586"/>
          <Constant key="Parameter_1664" name="KTKbeq" value="10"/>
        </ListOfConstants>
        <KineticLaw function="Function_47">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_327">
              <SourceParameter reference="Parameter_1664"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_286">
              <SourceParameter reference="Metabolite_57"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_330">
              <SourceParameter reference="Metabolite_45"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_328">
              <SourceParameter reference="Metabolite_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_315">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_332">
              <SourceParameter reference="Parameter_1663"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_56" name="Mureine synthesis" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_56">
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0006002"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_45" stoichiometry="2"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1665" name="v" value="0.00043711"/>
        </ListOfConstants>
        <KineticLaw function="Function_7">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_47">
              <SourceParameter reference="Parameter_1665"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_57" name="Aldolase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_57">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R01070"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_1602"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/4.1.2.13"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_51" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_63" stoichiometry="1"/>
          <Product metabolite="Metabolite_55" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1666" name="rmaxALDO" value="17.4146"/>
          <Constant key="Parameter_1667" name="kALDOeq" value="0.144"/>
          <Constant key="Parameter_1668" name="kALDOfdp" value="1.75"/>
          <Constant key="Parameter_1669" name="kALDOgap" value="0.088"/>
          <Constant key="Parameter_1670" name="VALDOblf" value="2"/>
          <Constant key="Parameter_1676" name="kALDOdhap" value="0.088"/>
          <Constant key="Parameter_1675" name="kALDOgapinh" value="0.6"/>
        </ListOfConstants>
        <KineticLaw function="Function_48">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_333">
              <SourceParameter reference="Parameter_1670"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_346">
              <SourceParameter reference="Metabolite_63"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_340">
              <SourceParameter reference="Metabolite_51"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_338">
              <SourceParameter reference="Metabolite_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_336">
              <SourceParameter reference="Parameter_1676"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_344">
              <SourceParameter reference="Parameter_1667"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_323">
              <SourceParameter reference="Parameter_1668"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_329">
              <SourceParameter reference="Parameter_1669"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_334">
              <SourceParameter reference="Parameter_1675"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_342">
              <SourceParameter reference="Parameter_1666"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_58" name="Glyceraldehyde-3-phosphate dehydrogenase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_58">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R01061"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_1847"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/1.2.1.12"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_55" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_65" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1674" name="rmaxGAPDH" value="921.594"/>
          <Constant key="Parameter_1671" name="KGAPDHeq" value="0.63"/>
          <Constant key="Parameter_1672" name="KGAPDHgap" value="0.683"/>
          <Constant key="Parameter_1673" name="KGAPDHpgp" value="1.04e-05"/>
          <Constant key="Parameter_1677" name="KGAPDHnad" value="0.252"/>
          <Constant key="Parameter_1678" name="KGAPDHnadh" value="1.09"/>
          <Constant key="Parameter_1681" name="cnad" value="1.4644"/>
          <Constant key="Parameter_1680" name="cnadh" value="0.0934"/>
        </ListOfConstants>
        <KineticLaw function="Function_90">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_791">
              <SourceParameter reference="Parameter_1671"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_712">
              <SourceParameter reference="Parameter_1672"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_718">
              <SourceParameter reference="Parameter_1677"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_787">
              <SourceParameter reference="Parameter_1678"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_788">
              <SourceParameter reference="Parameter_1673"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_792">
              <SourceParameter reference="Metabolite_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_785">
              <SourceParameter reference="ModelValue_12"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_717">
              <SourceParameter reference="ModelValue_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_767">
              <SourceParameter reference="Metabolite_65"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_716">
              <SourceParameter reference="Parameter_1674"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_59" name="Triosephosphate isomerase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_59">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R01015"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_469"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/5.3.1.1"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_63" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_55" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1679" name="rmaxTIS" value="68.6747"/>
          <Constant key="Parameter_1682" name="kTISeq" value="1.39"/>
          <Constant key="Parameter_1683" name="kTISdhap" value="2.8"/>
          <Constant key="Parameter_1684" name="kTISgap" value="0.3"/>
        </ListOfConstants>
        <KineticLaw function="Function_91">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_710">
              <SourceParameter reference="Metabolite_63"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_839">
              <SourceParameter reference="Metabolite_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_841">
              <SourceParameter reference="Parameter_1683"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_842">
              <SourceParameter reference="Parameter_1682"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_868">
              <SourceParameter reference="Parameter_1684"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_869">
              <SourceParameter reference="Parameter_1679"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_60" name="Tryptophan synthesis" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_60">
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0000162"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_43" stoichiometry="1"/>
          <Product metabolite="Metabolite_55" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1685" name="v" value="0.001037"/>
        </ListOfConstants>
        <KineticLaw function="Function_7">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_47">
              <SourceParameter reference="Parameter_1685"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_61" name="Glycerol-3-phosphate dehydrogenase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_61">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R00842"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_16938"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/1.1.1.8"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_63" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1686" name="rmaxG3PDH" value="0.0116204"/>
          <Constant key="Parameter_1687" name="KG3PDHdhap" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_51">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_359">
              <SourceParameter reference="Parameter_1687"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_337">
              <SourceParameter reference="Metabolite_63"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_351">
              <SourceParameter reference="Parameter_1686"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_62" name="Phosphoglycerate kinase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_62">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R01512"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_1186"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/2.7.2.3"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_65" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_67" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1688" name="rmaxPGK" value="3021.77"/>
          <Constant key="Parameter_1689" name="KPGKeq" value="1934.4"/>
          <Constant key="Parameter_1690" name="KPGKadp" value="0.185"/>
          <Constant key="Parameter_1691" name="KPGKatp" value="0.653"/>
          <Constant key="Parameter_1692" name="KPGKpgp" value="0.0468"/>
          <Constant key="Parameter_1693" name="KPGKpg3" value="0.473"/>
          <Constant key="Parameter_1694" name="cadp" value="0.582"/>
          <Constant key="Parameter_1695" name="catp" value="4.27"/>
        </ListOfConstants>
        <KineticLaw function="Function_92">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_884">
              <SourceParameter reference="Parameter_1690"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_885">
              <SourceParameter reference="Parameter_1691"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_886">
              <SourceParameter reference="Parameter_1689"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_887">
              <SourceParameter reference="Parameter_1693"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_888">
              <SourceParameter reference="Parameter_1692"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_889">
              <SourceParameter reference="ModelValue_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_890">
              <SourceParameter reference="ModelValue_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_891">
              <SourceParameter reference="Metabolite_67"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_892">
              <SourceParameter reference="Metabolite_65"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_893">
              <SourceParameter reference="Parameter_1688"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_63" name="Serine synthesis" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_63">
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0009070"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_67" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1696" name="rmaxSerSynth" value="0.0257121"/>
          <Constant key="Parameter_1697" name="KSerSynthpg3" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_53">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_376">
              <SourceParameter reference="Parameter_1697"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_372">
              <SourceParameter reference="Metabolite_67"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_368">
              <SourceParameter reference="Parameter_1696"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_64" name="Phosphoglycerate mutase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_64">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R01518"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_576"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/5.4.2.1"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_67" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_69" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1698" name="rmaxPGluMu" value="89.0497"/>
          <Constant key="Parameter_1699" name="KPGluMueq" value="0.188"/>
          <Constant key="Parameter_1700" name="KPGluMupg3" value="0.2"/>
          <Constant key="Parameter_1701" name="KPGluMupg2" value="0.369"/>
        </ListOfConstants>
        <KineticLaw function="Function_93">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_880">
              <SourceParameter reference="Parameter_1699"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_904">
              <SourceParameter reference="Parameter_1701"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_905">
              <SourceParameter reference="Parameter_1700"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_906">
              <SourceParameter reference="Metabolite_69"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_907">
              <SourceParameter reference="Metabolite_67"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_908">
              <SourceParameter reference="Parameter_1698"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_65" name="Enolase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_65">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R00658"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_1400"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/4.2.1.11"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_69" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_37" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1702" name="rmaxENO" value="330.448"/>
          <Constant key="Parameter_1703" name="KENOeq" value="6.73"/>
          <Constant key="Parameter_1704" name="KENOpg2" value="0.1"/>
          <Constant key="Parameter_1705" name="KENOpep" value="0.135"/>
        </ListOfConstants>
        <KineticLaw function="Function_94">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_915">
              <SourceParameter reference="Parameter_1703"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_916">
              <SourceParameter reference="Parameter_1705"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_917">
              <SourceParameter reference="Parameter_1704"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_918">
              <SourceParameter reference="Metabolite_37"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_919">
              <SourceParameter reference="Metabolite_69"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_920">
              <SourceParameter reference="Parameter_1702"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_66" name="Pyruvate kinase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_66">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R00200"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_1524"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/2.7.1.40"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_37" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_43" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_51" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_1706" name="rmaxPK" value="0.0611315"/>
          <Constant key="Parameter_1719" name="KPKpep" value="0.31"/>
          <Constant key="Parameter_1720" name="nPK" value="4"/>
          <Constant key="Parameter_1721" name="LPK" value="1000"/>
          <Constant key="Parameter_1722" name="KPKatp" value="22.5"/>
          <Constant key="Parameter_1723" name="KPKfdp" value="0.19"/>
          <Constant key="Parameter_1724" name="KPKamp" value="0.2"/>
          <Constant key="Parameter_1611" name="KPKadp" value="0.26"/>
          <Constant key="Parameter_1612" name="cadp" value="0.582"/>
          <Constant key="Parameter_1613" name="camp" value="0.954783"/>
          <Constant key="Parameter_1614" name="catp" value="4.27"/>
        </ListOfConstants>
        <KineticLaw function="Function_95">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_934">
              <SourceParameter reference="Parameter_1611"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_935">
              <SourceParameter reference="Parameter_1724"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_936">
              <SourceParameter reference="Parameter_1722"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_937">
              <SourceParameter reference="Parameter_1723"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_938">
              <SourceParameter reference="Parameter_1719"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_939">
              <SourceParameter reference="Parameter_1721"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_940">
              <SourceParameter reference="ModelValue_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_941">
              <SourceParameter reference="ModelValue_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_942">
              <SourceParameter reference="ModelValue_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_943">
              <SourceParameter reference="Metabolite_51"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_944">
              <SourceParameter reference="Metabolite_37"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_945">
              <SourceParameter reference="Parameter_1720"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_946">
              <SourceParameter reference="Parameter_1706"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_67" name="PEP carboxylase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_67">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R00345"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/4.1.1.31"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_37" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_51" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_1615" name="rmaxpepCxylase" value="0.107021"/>
          <Constant key="Parameter_1616" name="KpepCxylasefdp" value="0.7"/>
          <Constant key="Parameter_1617" name="npepCxylasefdp" value="4.21"/>
          <Constant key="Parameter_1618" name="KpepCxylasepep" value="4.07"/>
        </ListOfConstants>
        <KineticLaw function="Function_96">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_876">
              <SourceParameter reference="Parameter_1616"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_843">
              <SourceParameter reference="Parameter_1618"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_840">
              <SourceParameter reference="Metabolite_51"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_930">
              <SourceParameter reference="Metabolite_37"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_928">
              <SourceParameter reference="Parameter_1617"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_932">
              <SourceParameter reference="Parameter_1615"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_68" name="Synthesis 1" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_68">
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0009423"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_37" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1619" name="rmaxSynth1" value="0.019539"/>
          <Constant key="Parameter_1620" name="KSynth1pep" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_58">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_370">
              <SourceParameter reference="Parameter_1620"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_393">
              <SourceParameter reference="Metabolite_37"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_401">
              <SourceParameter reference="Parameter_1619"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_69" name="Synthesis 2" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_69">
    <CopasiMT:hasPart>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0006523"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0009097"/>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0019877"/>
      </rdf:Bag>
    </CopasiMT:hasPart>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_43" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1621" name="rmaxSynth2" value="0.0736186"/>
          <Constant key="Parameter_1725" name="KSynth2pyr" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_59">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_405">
              <SourceParameter reference="Parameter_1725"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_389">
              <SourceParameter reference="Metabolite_43"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_408">
              <SourceParameter reference="Parameter_1621"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_70" name="DAHP synthesis" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_70">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R01826"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/2.5.1.54"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_57" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_37" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1726" name="rmaxDAHPS" value="0.107953"/>
          <Constant key="Parameter_1354" name="nDAHPSe4p" value="2.6"/>
          <Constant key="Parameter_1353" name="nDAHPSpep" value="2.2"/>
          <Constant key="Parameter_1352" name="KDAHPSe4p" value="0.035"/>
          <Constant key="Parameter_1351" name="KDAHPSpep" value="0.0053"/>
        </ListOfConstants>
        <KineticLaw function="Function_60">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_409">
              <SourceParameter reference="Parameter_1352"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_415">
              <SourceParameter reference="Parameter_1351"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_411">
              <SourceParameter reference="Metabolite_57"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_413">
              <SourceParameter reference="Metabolite_37"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_397">
              <SourceParameter reference="Parameter_1354"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_419">
              <SourceParameter reference="Parameter_1353"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_417">
              <SourceParameter reference="Parameter_1726"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_71" name="Pyruvate dehydrogenase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_71">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R00209"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isPartOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.pathway/rn00620"/>
      </rdf:Bag>
    </CopasiMT:isPartOf>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/1.2.1.51"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_43" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1350" name="rmaxPDH" value="6.05953"/>
          <Constant key="Parameter_1349" name="nPDH" value="3.68"/>
          <Constant key="Parameter_1348" name="KPDHpyr" value="1159"/>
        </ListOfConstants>
        <KineticLaw function="Function_61">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_420">
              <SourceParameter reference="Parameter_1348"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_412">
              <SourceParameter reference="Metabolite_43"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_416">
              <SourceParameter reference="Parameter_1349"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_385">
              <SourceParameter reference="Parameter_1350"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_72" name="Methionine synthesis" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_72">
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0042866"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_43" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1347" name="v" value="0.0022627"/>
        </ListOfConstants>
        <KineticLaw function="Function_7">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_47">
              <SourceParameter reference="Parameter_1347"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_73" name="6-Phosphogluconate dehydrogenase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_73">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R01528"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_611"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/1.1.1.44"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_49" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_71" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1346" name="rmaxPGDH" value="16.2324"/>
          <Constant key="Parameter_1345" name="KPGDHpg" value="37.5"/>
          <Constant key="Parameter_1344" name="KPGDHnadp" value="0.0506"/>
          <Constant key="Parameter_1343" name="KPGDHnadphinh" value="0.0138"/>
          <Constant key="Parameter_1342" name="KPGDHatpinh" value="208"/>
          <Constant key="Parameter_1341" name="catp" value="4.27"/>
          <Constant key="Parameter_1340" name="cnadp" value="0.196759"/>
          <Constant key="Parameter_1339" name="cnadph" value="0.062"/>
        </ListOfConstants>
        <KineticLaw function="Function_97">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_986">
              <SourceParameter reference="Parameter_1342"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_987">
              <SourceParameter reference="Parameter_1344"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_988">
              <SourceParameter reference="Parameter_1343"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_989">
              <SourceParameter reference="Parameter_1345"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_990">
              <SourceParameter reference="ModelValue_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_991">
              <SourceParameter reference="ModelValue_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_992">
              <SourceParameter reference="ModelValue_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_993">
              <SourceParameter reference="Metabolite_49"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_994">
              <SourceParameter reference="Parameter_1346"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_74" name="Ribose-phosphate isomerase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_74">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R01056"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_6907"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/5.3.1.6"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_71" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_61" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1338" name="rmaxR5PI" value="4.83841"/>
          <Constant key="Parameter_1337" name="KR5PIeq" value="4"/>
        </ListOfConstants>
        <KineticLaw function="Function_63">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_435">
              <SourceParameter reference="Parameter_1337"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_431">
              <SourceParameter reference="Metabolite_61"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Metabolite_71"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_423">
              <SourceParameter reference="Parameter_1338"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_75" name="Ribulose-phosphate epimerase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_75">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R01529"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_1522"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/5.1.3.1"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_71" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_59" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1336" name="rmaxRu5P" value="6.73903"/>
          <Constant key="Parameter_1335" name="KRu5Peq" value="1.4"/>
        </ListOfConstants>
        <KineticLaw function="Function_64">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="Parameter_1335"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_410">
              <SourceParameter reference="Metabolite_71"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_429">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_437">
              <SourceParameter reference="Parameter_1336"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_76" name="Ribose phosphate pyrophosphokinase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_76">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R01049"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isHomologTo>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/reactome/REACT_2023"/>
      </rdf:Bag>
    </CopasiMT:isHomologTo>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/2.7.6.1"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_61" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1334" name="rmaxRPPK" value="0.0129005"/>
          <Constant key="Parameter_1333" name="KRPPKrib5p" value="0.1"/>
        </ListOfConstants>
        <KineticLaw function="Function_65">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_438">
              <SourceParameter reference="Parameter_1333"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_433">
              <SourceParameter reference="Metabolite_61"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_439">
              <SourceParameter reference="Parameter_1334"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_77" name="Glucose-1-phosphate adenyltransferase" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_77">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/kegg.reaction/R00948"/>
      </rdf:Bag>
    </CopasiMT:is>
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/ec-code/2.7.7.27"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_47" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_51" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_1332" name="rmaxG1PAT" value="0.00752546"/>
          <Constant key="Parameter_1331" name="KG1PATfdp" value="0.119"/>
          <Constant key="Parameter_1330" name="nG1PATfdp" value="1.2"/>
          <Constant key="Parameter_1329" name="KG1PATatp" value="4.42"/>
          <Constant key="Parameter_1328" name="KG1PATg1p" value="3.2"/>
          <Constant key="Parameter_1327" name="catp" value="4.27"/>
        </ListOfConstants>
        <KineticLaw function="Function_98">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_1014">
              <SourceParameter reference="Parameter_1329"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1015">
              <SourceParameter reference="Parameter_1331"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1016">
              <SourceParameter reference="Parameter_1328"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1017">
              <SourceParameter reference="ModelValue_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1018">
              <SourceParameter reference="Metabolite_51"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1019">
              <SourceParameter reference="Metabolite_47"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1020">
              <SourceParameter reference="Parameter_1330"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_1021">
              <SourceParameter reference="Parameter_1332"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_78" name="G6P degradation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_78">
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0044275"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_41" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1326" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_67">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_453">
              <SourceParameter reference="Metabolite_41"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Parameter_1326"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_79" name="F6P degradation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_79">
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0044275"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_45" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1325" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_68">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_447">
              <SourceParameter reference="Metabolite_45"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_445">
              <SourceParameter reference="Parameter_1325"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_80" name="FDP degradation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_80">
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0044275"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_51" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1324" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_69">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_443">
              <SourceParameter reference="Metabolite_51"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_441">
              <SourceParameter reference="Parameter_1324"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_81" name="GAP degradation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_81">
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0019683"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_55" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1323" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_70">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_425">
              <SourceParameter reference="Metabolite_55"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_454">
              <SourceParameter reference="Parameter_1323"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_82" name="DHAP degradation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_82">
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0044275"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_63" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1322" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_71">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_455">
              <SourceParameter reference="Metabolite_63"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_456">
              <SourceParameter reference="Parameter_1322"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_83" name="PGP degradation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_83">
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0044275"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_65" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1321" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_72">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_457">
              <SourceParameter reference="Metabolite_65"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_458">
              <SourceParameter reference="Parameter_1321"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_84" name="PG3 degradation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_84">
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0044275"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_67" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1320" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_73">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_459">
              <SourceParameter reference="Metabolite_67"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_460">
              <SourceParameter reference="Parameter_1320"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_85" name="PG2 degradation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_85">
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0044275"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_69" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1319" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_74">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_461">
              <SourceParameter reference="Metabolite_69"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_462">
              <SourceParameter reference="Parameter_1319"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_86" name="PEP degradation" reversible="true" fast="false">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_86">
    <CopasiMT:isVersionOf>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/obo.go/GO:0046395"/>
      </rdf:Bag>
    </CopasiMT:isVersionOf>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_37" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1318" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_75">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_463">
              <SourceParameter reference="Metabolite_37"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_464">
              <SourceParameter reference="Parameter_1318"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_87" name="Ribu5P dilution" reversible="true" fast="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_71" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1317" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_76">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_465">
              <SourceParameter reference="Metabolite_71"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_466">
              <SourceParameter reference="Parameter_1317"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_88" name="Rib5P dilution" reversible="true" fast="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_61" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1316" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_77">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_467">
              <SourceParameter reference="Metabolite_61"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_468">
              <SourceParameter reference="Parameter_1316"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_89" name="XYL5P dilution" reversible="true" fast="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_59" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1315" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_78">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_469">
              <SourceParameter reference="Metabolite_59"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_470">
              <SourceParameter reference="Parameter_1315"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_90" name="SED7P dilution" reversible="true" fast="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_53" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1314" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_79">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_471">
              <SourceParameter reference="Metabolite_53"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_472">
              <SourceParameter reference="Parameter_1314"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_91" name="Pyruvate dilution" reversible="true" fast="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_43" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1313" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_80">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_473">
              <SourceParameter reference="Metabolite_43"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_474">
              <SourceParameter reference="Parameter_1313"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_92" name="PG dilution" reversible="true" fast="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_49" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1312" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_81">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_475">
              <SourceParameter reference="Metabolite_49"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_476">
              <SourceParameter reference="Parameter_1312"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_93" name="E4P dilution" reversible="true" fast="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_57" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1311" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_82">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_477">
              <SourceParameter reference="Metabolite_57"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_478">
              <SourceParameter reference="Parameter_1311"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_94" name="GLP dilution" reversible="true" fast="false">
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_47" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_1310" name="mu" value="2.78e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_83">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_479">
              <SourceParameter reference="Metabolite_47"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_480">
              <SourceParameter reference="Parameter_1310"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_95" name="Extracellular glucose kinetics" reversible="true" fast="false">
        <ListOfProducts>
          <Product metabolite="Metabolite_39" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_1309" name="Dil" value="2.78e-05"/>
          <Constant key="Parameter_1308" name="cfeed" value="110.96"/>
        </ListOfConstants>
        <KineticLaw function="Function_84">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_484">
              <SourceParameter reference="Parameter_1309"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_482">
              <SourceParameter reference="Parameter_1308"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_481">
              <SourceParameter reference="Metabolite_39"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <ListOfModelParameterSets activeSet="ModelParameterSet_0">
      <ModelParameterSet key="ModelParameterSet_0" name="Initial State">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[extracellular]" value="1" type="Compartment" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[extracellular],Vector=Metabolites[Extracellular Glucose]" value="1.204428358e+21" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Phosphoenol pyruvate]" value="1.60791185793e+21" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Glucose-6-Phosphate]" value="2.095705342920001e+21" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Pyruvate]" value="1.60791185793e+21" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Fructose-6-Phosphate]" value="3.613285074000001e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Glucose-1-Phosphate]" value="3.932458588870001e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[6-Phosphogluconate]" value="4.865890566320001e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Fructose-1\,6-bisphosphate]" value="1.638022566880001e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[sedoheptulose-7-phosphate]" value="1.662111134040001e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Glyceraldehyde-3-Phosphate]" value="1.31282691022e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Erythrose-4-phosphate]" value="5.901698954200001e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Xylulose-5-phosphate]" value="8.310555670200005e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Ribose-5-phosphate]" value="2.39681243242e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Dihydroxyacetonephosphate]" value="1.00569767893e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[1\,3-diphosphosphoglycerate]" value="4.817713432000004e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[3-Phosphoglycerate]" value="1.28271620127e+21" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[2-Phosphoglycerate]" value="2.402834574210001e+20" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Ribulose-5-phosphate]" value="6.684577386900001e+19" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[catp]" value="4.27" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[cadp]" value="0.582" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[camp]" value="0.9547829457364341" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[cnadp]" value="0.1967593360995851" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[cnadph]" value="0.062" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[cnad]" value="1.464399311851686" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[cnadh]" value="0.0934" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphotransferase system]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphotransferase system],ParameterGroup=Parameters,Parameter=rmaxPTS" value="7829.78" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphotransferase system],ParameterGroup=Parameters,Parameter=KPTSa1" value="3082.3" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphotransferase system],ParameterGroup=Parameters,Parameter=KPTSa2" value="0.01" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphotransferase system],ParameterGroup=Parameters,Parameter=KPTSa3" value="245.3" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphotransferase system],ParameterGroup=Parameters,Parameter=nPTSg6p" value="3.66" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphotransferase system],ParameterGroup=Parameters,Parameter=KPTSg6p" value="2.15" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate isomerase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate isomerase],ParameterGroup=Parameters,Parameter=rmaxPGI" value="650.9878687" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate isomerase],ParameterGroup=Parameters,Parameter=KPGIeq" value="0.1725" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate isomerase],ParameterGroup=Parameters,Parameter=KPGIg6p" value="2.9" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate isomerase],ParameterGroup=Parameters,Parameter=KPGIf6p" value="0.266" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate isomerase],ParameterGroup=Parameters,Parameter=KPGIf6ppginh" value="0.2" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate isomerase],ParameterGroup=Parameters,Parameter=KPGIg6ppginh" value="0.2" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglucomutase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglucomutase],ParameterGroup=Parameters,Parameter=rmaxPGM" value="0.8398242773" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglucomutase],ParameterGroup=Parameters,Parameter=KPGMeq" value="0.196" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglucomutase],ParameterGroup=Parameters,Parameter=KPGMg6p" value="1.038" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglucomutase],ParameterGroup=Parameters,Parameter=KPGMg1p" value="0.0136" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate dehydrogenase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=rmaxG6PDH" value="1.380196955" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=KG6PDHg6p" value="14.4" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=KG6PDHnadphg6pinh" value="6.43" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=KG6PDHnadp" value="0.0246" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=KG6PDHnadphnadpinh" value="0.01" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=cnadp" value="0.1967593360995851" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[cnadp],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=cnadph" value="0.062" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[cnadph],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphofructokinase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphofructokinase],ParameterGroup=Parameters,Parameter=rmaxPFK" value="1840.584747" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphofructokinase],ParameterGroup=Parameters,Parameter=KPFKatps" value="0.123" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphofructokinase],ParameterGroup=Parameters,Parameter=KPFKadpc" value="4.14" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphofructokinase],ParameterGroup=Parameters,Parameter=KPFKf6ps" value="0.325" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphofructokinase],ParameterGroup=Parameters,Parameter=KPFKpep" value="3.26" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphofructokinase],ParameterGroup=Parameters,Parameter=KPFKadpb" value="3.89" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphofructokinase],ParameterGroup=Parameters,Parameter=KPFKampb" value="3.2" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphofructokinase],ParameterGroup=Parameters,Parameter=KPFKadpa" value="128" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphofructokinase],ParameterGroup=Parameters,Parameter=KPFKampa" value="19.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphofructokinase],ParameterGroup=Parameters,Parameter=LPFK" value="5629067" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphofructokinase],ParameterGroup=Parameters,Parameter=nPFK" value="11.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphofructokinase],ParameterGroup=Parameters,Parameter=cadp" value="0.582" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[cadp],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphofructokinase],ParameterGroup=Parameters,Parameter=camp" value="0.9547829457364341" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[camp],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphofructokinase],ParameterGroup=Parameters,Parameter=catp" value="4.27" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[catp],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Transaldolase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Transaldolase],ParameterGroup=Parameters,Parameter=rmaxTA" value="10.87164108" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Transaldolase],ParameterGroup=Parameters,Parameter=KTAeq" value="1.05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Transketolase a]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Transketolase a],ParameterGroup=Parameters,Parameter=rmaxTKa" value="9.473384783" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Transketolase a],ParameterGroup=Parameters,Parameter=KTKaeq" value="1.2" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Transketolase b]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Transketolase b],ParameterGroup=Parameters,Parameter=rmaxTKb" value="86.55855855" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Transketolase b],ParameterGroup=Parameters,Parameter=KTKbeq" value="10" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Mureine synthesis]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Mureine synthesis],ParameterGroup=Parameters,Parameter=v" value="0.00043711" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Aldolase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Aldolase],ParameterGroup=Parameters,Parameter=rmaxALDO" value="17.41464425" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Aldolase],ParameterGroup=Parameters,Parameter=kALDOeq" value="0.144" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Aldolase],ParameterGroup=Parameters,Parameter=kALDOfdp" value="1.75" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Aldolase],ParameterGroup=Parameters,Parameter=kALDOgap" value="0.08799999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Aldolase],ParameterGroup=Parameters,Parameter=VALDOblf" value="2" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Aldolase],ParameterGroup=Parameters,Parameter=kALDOdhap" value="0.08799999999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Aldolase],ParameterGroup=Parameters,Parameter=kALDOgapinh" value="0.6" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glyceraldehyde-3-phosphate dehydrogenase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glyceraldehyde-3-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=rmaxGAPDH" value="921.5942861" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glyceraldehyde-3-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=KGAPDHeq" value="0.63" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glyceraldehyde-3-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=KGAPDHgap" value="0.6830000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glyceraldehyde-3-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=KGAPDHpgp" value="1.04e-05" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glyceraldehyde-3-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=KGAPDHnad" value="0.252" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glyceraldehyde-3-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=KGAPDHnadh" value="1.09" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glyceraldehyde-3-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=cnad" value="1.464399311851686" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[cnad],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glyceraldehyde-3-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=cnadh" value="0.0934" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[cnadh],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Triosephosphate isomerase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Triosephosphate isomerase],ParameterGroup=Parameters,Parameter=rmaxTIS" value="68.67474392" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Triosephosphate isomerase],ParameterGroup=Parameters,Parameter=kTISeq" value="1.39" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Triosephosphate isomerase],ParameterGroup=Parameters,Parameter=kTISdhap" value="2.8" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Triosephosphate isomerase],ParameterGroup=Parameters,Parameter=kTISgap" value="0.3" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Tryptophan synthesis]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Tryptophan synthesis],ParameterGroup=Parameters,Parameter=v" value="0.001037" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glycerol-3-phosphate dehydrogenase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glycerol-3-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=rmaxG3PDH" value="0.01162042696" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glycerol-3-phosphate dehydrogenase],ParameterGroup=Parameters,Parameter=KG3PDHdhap" value="1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglycerate kinase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglycerate kinase],ParameterGroup=Parameters,Parameter=rmaxPGK" value="3021.773771" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglycerate kinase],ParameterGroup=Parameters,Parameter=KPGKeq" value="1934.4" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglycerate kinase],ParameterGroup=Parameters,Parameter=KPGKadp" value="0.185" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglycerate kinase],ParameterGroup=Parameters,Parameter=KPGKatp" value="0.653" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglycerate kinase],ParameterGroup=Parameters,Parameter=KPGKpgp" value="0.0468" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglycerate kinase],ParameterGroup=Parameters,Parameter=KPGKpg3" value="0.473" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglycerate kinase],ParameterGroup=Parameters,Parameter=cadp" value="0.582" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[cadp],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglycerate kinase],ParameterGroup=Parameters,Parameter=catp" value="4.27" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[catp],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Serine synthesis]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Serine synthesis],ParameterGroup=Parameters,Parameter=rmaxSerSynth" value="0.025712107" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Serine synthesis],ParameterGroup=Parameters,Parameter=KSerSynthpg3" value="1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglycerate mutase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglycerate mutase],ParameterGroup=Parameters,Parameter=rmaxPGluMu" value="89.04965407" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglycerate mutase],ParameterGroup=Parameters,Parameter=KPGluMueq" value="0.188" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglycerate mutase],ParameterGroup=Parameters,Parameter=KPGluMupg3" value="0.2" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglycerate mutase],ParameterGroup=Parameters,Parameter=KPGluMupg2" value="0.369" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Enolase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Enolase],ParameterGroup=Parameters,Parameter=rmaxENO" value="330.4476151" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Enolase],ParameterGroup=Parameters,Parameter=KENOeq" value="6.73" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Enolase],ParameterGroup=Parameters,Parameter=KENOpg2" value="0.1" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Enolase],ParameterGroup=Parameters,Parameter=KENOpep" value="0.135" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate kinase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate kinase],ParameterGroup=Parameters,Parameter=rmaxPK" value="0.06113150238" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate kinase],ParameterGroup=Parameters,Parameter=KPKpep" value="0.31" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate kinase],ParameterGroup=Parameters,Parameter=nPK" value="4" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate kinase],ParameterGroup=Parameters,Parameter=LPK" value="1000" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate kinase],ParameterGroup=Parameters,Parameter=KPKatp" value="22.5" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate kinase],ParameterGroup=Parameters,Parameter=KPKfdp" value="0.19" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate kinase],ParameterGroup=Parameters,Parameter=KPKamp" value="0.2" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate kinase],ParameterGroup=Parameters,Parameter=KPKadp" value="0.26" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate kinase],ParameterGroup=Parameters,Parameter=cadp" value="0.582" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[cadp],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate kinase],ParameterGroup=Parameters,Parameter=camp" value="0.9547829457364341" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[camp],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate kinase],ParameterGroup=Parameters,Parameter=catp" value="4.27" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[catp],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PEP carboxylase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PEP carboxylase],ParameterGroup=Parameters,Parameter=rmaxpepCxylase" value="0.1070205858" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PEP carboxylase],ParameterGroup=Parameters,Parameter=KpepCxylasefdp" value="0.7" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PEP carboxylase],ParameterGroup=Parameters,Parameter=npepCxylasefdp" value="4.21" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PEP carboxylase],ParameterGroup=Parameters,Parameter=KpepCxylasepep" value="4.07" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Synthesis 1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Synthesis 1],ParameterGroup=Parameters,Parameter=rmaxSynth1" value="0.01953897003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Synthesis 1],ParameterGroup=Parameters,Parameter=KSynth1pep" value="1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Synthesis 2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Synthesis 2],ParameterGroup=Parameters,Parameter=rmaxSynth2" value="0.07361855054999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Synthesis 2],ParameterGroup=Parameters,Parameter=KSynth2pyr" value="1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[DAHP synthesis]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[DAHP synthesis],ParameterGroup=Parameters,Parameter=rmaxDAHPS" value="0.1079531227" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[DAHP synthesis],ParameterGroup=Parameters,Parameter=nDAHPSe4p" value="2.6" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[DAHP synthesis],ParameterGroup=Parameters,Parameter=nDAHPSpep" value="2.2" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[DAHP synthesis],ParameterGroup=Parameters,Parameter=KDAHPSe4p" value="0.035" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[DAHP synthesis],ParameterGroup=Parameters,Parameter=KDAHPSpep" value="0.0053" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate dehydrogenase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate dehydrogenase],ParameterGroup=Parameters,Parameter=rmaxPDH" value="6.059531017" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate dehydrogenase],ParameterGroup=Parameters,Parameter=nPDH" value="3.68" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate dehydrogenase],ParameterGroup=Parameters,Parameter=KPDHpyr" value="1159" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Methionine synthesis]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Methionine synthesis],ParameterGroup=Parameters,Parameter=v" value="0.0022627" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[6-Phosphogluconate dehydrogenase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[6-Phosphogluconate dehydrogenase],ParameterGroup=Parameters,Parameter=rmaxPGDH" value="16.23235977" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[6-Phosphogluconate dehydrogenase],ParameterGroup=Parameters,Parameter=KPGDHpg" value="37.5" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[6-Phosphogluconate dehydrogenase],ParameterGroup=Parameters,Parameter=KPGDHnadp" value="0.0506" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[6-Phosphogluconate dehydrogenase],ParameterGroup=Parameters,Parameter=KPGDHnadphinh" value="0.0138" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[6-Phosphogluconate dehydrogenase],ParameterGroup=Parameters,Parameter=KPGDHatpinh" value="208" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[6-Phosphogluconate dehydrogenase],ParameterGroup=Parameters,Parameter=catp" value="4.27" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[catp],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[6-Phosphogluconate dehydrogenase],ParameterGroup=Parameters,Parameter=cnadp" value="0.1967593360995851" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[cnadp],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[6-Phosphogluconate dehydrogenase],ParameterGroup=Parameters,Parameter=cnadph" value="0.062" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[cnadph],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Ribose-phosphate isomerase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Ribose-phosphate isomerase],ParameterGroup=Parameters,Parameter=rmaxR5PI" value="4.83841193" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Ribose-phosphate isomerase],ParameterGroup=Parameters,Parameter=KR5PIeq" value="4" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Ribulose-phosphate epimerase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Ribulose-phosphate epimerase],ParameterGroup=Parameters,Parameter=rmaxRu5P" value="6.739029475" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Ribulose-phosphate epimerase],ParameterGroup=Parameters,Parameter=KRu5Peq" value="1.4" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Ribose phosphate pyrophosphokinase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Ribose phosphate pyrophosphokinase],ParameterGroup=Parameters,Parameter=rmaxRPPK" value="0.01290045226" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Ribose phosphate pyrophosphokinase],ParameterGroup=Parameters,Parameter=KRPPKrib5p" value="0.1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-1-phosphate adenyltransferase]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-1-phosphate adenyltransferase],ParameterGroup=Parameters,Parameter=rmaxG1PAT" value="0.007525458026" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-1-phosphate adenyltransferase],ParameterGroup=Parameters,Parameter=KG1PATfdp" value="0.119" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-1-phosphate adenyltransferase],ParameterGroup=Parameters,Parameter=nG1PATfdp" value="1.2" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-1-phosphate adenyltransferase],ParameterGroup=Parameters,Parameter=KG1PATatp" value="4.42" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-1-phosphate adenyltransferase],ParameterGroup=Parameters,Parameter=KG1PATg1p" value="3.2" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-1-phosphate adenyltransferase],ParameterGroup=Parameters,Parameter=catp" value="4.27" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Values[catp],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[G6P degradation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[G6P degradation],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[F6P degradation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[F6P degradation],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[FDP degradation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[FDP degradation],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[GAP degradation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[GAP degradation],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[DHAP degradation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[DHAP degradation],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PGP degradation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PGP degradation],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PG3 degradation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PG3 degradation],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PG2 degradation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PG2 degradation],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PEP degradation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PEP degradation],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Ribu5P dilution]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Ribu5P dilution],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Rib5P dilution]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Rib5P dilution],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[XYL5P dilution]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[XYL5P dilution],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[SED7P dilution]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[SED7P dilution],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate dilution]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate dilution],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PG dilution]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PG dilution],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[E4P dilution]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[E4P dilution],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[GLP dilution]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[GLP dilution],ParameterGroup=Parameters,Parameter=mu" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Extracellular glucose kinetics]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Extracellular glucose kinetics],ParameterGroup=Parameters,Parameter=Dil" value="2.78e-05" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Extracellular glucose kinetics],ParameterGroup=Parameters,Parameter=cfeed" value="110.96" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
    </ListOfModelParameterSets>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_4"/>
      <StateTemplateVariable objectReference="Metabolite_37"/>
      <StateTemplateVariable objectReference="Metabolite_43"/>
      <StateTemplateVariable objectReference="Metabolite_45"/>
      <StateTemplateVariable objectReference="Metabolite_55"/>
      <StateTemplateVariable objectReference="Metabolite_41"/>
      <StateTemplateVariable objectReference="Metabolite_63"/>
      <StateTemplateVariable objectReference="Metabolite_67"/>
      <StateTemplateVariable objectReference="Metabolite_71"/>
      <StateTemplateVariable objectReference="Metabolite_61"/>
      <StateTemplateVariable objectReference="Metabolite_57"/>
      <StateTemplateVariable objectReference="Metabolite_59"/>
      <StateTemplateVariable objectReference="Metabolite_47"/>
      <StateTemplateVariable objectReference="Metabolite_69"/>
      <StateTemplateVariable objectReference="Metabolite_49"/>
      <StateTemplateVariable objectReference="Metabolite_65"/>
      <StateTemplateVariable objectReference="Metabolite_51"/>
      <StateTemplateVariable objectReference="Metabolite_53"/>
      <StateTemplateVariable objectReference="Metabolite_39"/>
      <StateTemplateVariable objectReference="ModelValue_7"/>
      <StateTemplateVariable objectReference="ModelValue_8"/>
      <StateTemplateVariable objectReference="ModelValue_9"/>
      <StateTemplateVariable objectReference="ModelValue_10"/>
      <StateTemplateVariable objectReference="ModelValue_11"/>
      <StateTemplateVariable objectReference="ModelValue_12"/>
      <StateTemplateVariable objectReference="ModelValue_13"/>
      <StateTemplateVariable objectReference="Compartment_5"/>
      <StateTemplateVariable objectReference="Compartment_7"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 1.60791185793e+21 1.60791185793e+21 3.613285074000001e+20 1.31282691022e+20 2.095705342920001e+21 1.00569767893e+20 1.28271620127e+21 6.684577386900001e+19 2.39681243242e+20 5.901698954200001e+19 8.310555670200005e+19 3.932458588870001e+20 2.402834574210001e+20 4.865890566320001e+20 4.817713432000004e+18 1.638022566880001e+20 1.662111134040001e+20 1.204428358e+21 4.27 0.582 0.9547829457364341 0.1967593360995851 0.062 1.464399311851686 0.0934 1 1 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_12" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_8" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="JacobianRequested" type="bool" value="1"/>
        <Parameter name="StabilityAnalysisRequested" type="bool" value="1"/>
      </Problem>
      <Method name="Enhanced Newton" type="EnhancedNewton">
        <Parameter name="Resolution" type="unsignedFloat" value="1e-09"/>
        <Parameter name="Derivation Factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Use Newton" type="bool" value="1"/>
        <Parameter name="Use Integration" type="bool" value="1"/>
        <Parameter name="Use Back Integration" type="bool" value="1"/>
        <Parameter name="Accept Negative Concentrations" type="bool" value="0"/>
        <Parameter name="Iteration Limit" type="unsignedInteger" value="50"/>
        <Parameter name="Maximum duration for forward integration" type="unsignedFloat" value="1000000000"/>
        <Parameter name="Maximum duration for backward integration" type="unsignedFloat" value="1000000"/>
      </Method>
    </Task>
    <Task key="Task_11" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Continue on Simultaneous Events" type="bool" value="1"/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="1e-06"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="1e-12"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_10" name="Scan" type="scan" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="1"/>
        <ParameterGroup name="ScanItems">
        </ParameterGroup>
        <Parameter name="Output in subtask" type="bool" value="1"/>
        <Parameter name="Adjust initial conditions" type="bool" value="0"/>
      </Problem>
      <Method name="Scan Framework" type="ScanFramework">
      </Method>
    </Task>
    <Task key="Task_9" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_7" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_8" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_6" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Subtask" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <ParameterText name="ObjectiveExpression" type="expression">
          
        </ParameterText>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
      </Problem>
      <Method name="Random Search" type="RandomSearch">
        <Parameter name="Number of Iterations" type="unsignedInteger" value="100000"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_7" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_5" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
        <Parameter name="Steady-State" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <Parameter name="Time-Course" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
        <Parameter name="Create Parameter Sets" type="bool" value="0"/>
        <ParameterGroup name="Experiment Set">
        </ParameterGroup>
        <ParameterGroup name="Validation Set">
          <Parameter name="Weight" type="unsignedFloat" value="1"/>
          <Parameter name="Threshold" type="unsignedInteger" value="5"/>
        </ParameterGroup>
      </Problem>
      <Method name="Evolutionary Programming" type="EvolutionaryProgram">
        <Parameter name="Number of Generations" type="unsignedInteger" value="200"/>
        <Parameter name="Population Size" type="unsignedInteger" value="20"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_6" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_4" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_12"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1e-09"/>
      </Method>
    </Task>
    <Task key="Task_5" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_3" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="ExponentNumber" type="unsignedInteger" value="3"/>
        <Parameter name="DivergenceRequested" type="bool" value="1"/>
        <Parameter name="TransientTime" type="float" value="0"/>
      </Problem>
      <Method name="Wolf Method" type="WolfMethod">
        <Parameter name="Orthonormalization Interval" type="unsignedFloat" value="1"/>
        <Parameter name="Overall time" type="unsignedFloat" value="1000"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="1e-06"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="1e-12"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_4" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_2" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
      </Problem>
      <Method name="ILDM (LSODA,Deuflhard)" type="TimeScaleSeparation(ILDM,Deuflhard)">
        <Parameter name="Deuflhard Tolerance" type="unsignedFloat" value="1e-06"/>
      </Method>
    </Task>
    <Task key="Task_3" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_1" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="SubtaskType" type="unsignedInteger" value="1"/>
        <ParameterGroup name="TargetFunctions">
          <Parameter name="SingleObject" type="cn" value=""/>
          <Parameter name="ObjectListType" type="unsignedInteger" value="7"/>
        </ParameterGroup>
        <ParameterGroup name="ListOfVariables">
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="41"/>
          </ParameterGroup>
        </ParameterGroup>
      </Problem>
      <Method name="Sensitivities Method" type="SensitivitiesMethod">
        <Parameter name="Delta factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Delta minimum" type="unsignedFloat" value="1e-12"/>
      </Method>
    </Task>
    <Task key="Task_2" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_1" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Continue on Simultaneous Events" type="bool" value="0"/>
        <Parameter name="LimitCrossings" type="bool" value="0"/>
        <Parameter name="NumCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitOutTime" type="bool" value="0"/>
        <Parameter name="LimitOutCrossings" type="bool" value="0"/>
        <Parameter name="PositiveDirection" type="bool" value="1"/>
        <Parameter name="NumOutCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitUntilConvergence" type="bool" value="0"/>
        <Parameter name="ConvergenceTolerance" type="float" value="1e-06"/>
        <Parameter name="Threshold" type="float" value="0"/>
        <Parameter name="DelayOutputUntilConvergence" type="bool" value="0"/>
        <Parameter name="OutputConvergenceTolerance" type="float" value="1e-06"/>
        <ParameterText name="TriggerExpression" type="expression">
          
        </ParameterText>
        <Parameter name="SingleVariable" type="cn" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="1e-06"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="1e-12"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_13" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_0" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_12"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_8" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_7" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_6" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_5" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_4" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_3" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_2" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_1" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_0" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_18" name="Time Course with Fluxes" taskType="timeCourse" separator="&#x09;" precision="8">
      <Comment>
      </Comment>
      <Table printTitle="1">
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[extracellular],Vector=Metabolites[Extracellular Glucose],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Glucose-6-Phosphate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Fructose-6-Phosphate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Fructose-1\,6-bisphosphate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Glyceraldehyde-3-Phosphate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Dihydroxyacetonephosphate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[1\,3-diphosphosphoglycerate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[3-Phosphoglycerate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[2-Phosphoglycerate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Phosphoenol pyruvate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Pyruvate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[6-Phosphogluconate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Ribulose-5-phosphate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Xylulose-5-phosphate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[sedoheptulose-7-phosphate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Ribose-5-phosphate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Erythrose-4-phosphate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Compartments[cytosol],Vector=Metabolites[Glucose-1-Phosphate],Reference=Concentration"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Extracellular glucose kinetics],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphotransferase system],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate isomerase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglucomutase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-6-phosphate dehydrogenase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphofructokinase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Transaldolase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Transketolase a],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Transketolase b],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Mureine synthesis],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Aldolase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glyceraldehyde-3-phosphate dehydrogenase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Triosephosphate isomerase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Tryptophan synthesis],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glycerol-3-phosphate dehydrogenase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglycerate kinase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Serine synthesis],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Phosphoglycerate mutase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Enolase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate kinase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PEP carboxylase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Synthesis 1],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Synthesis 2],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[DAHP synthesis],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate dehydrogenase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Methionine synthesis],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[6-Phosphogluconate dehydrogenase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Ribose-phosphate isomerase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Ribulose-phosphate epimerase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Ribose phosphate pyrophosphokinase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Glucose-1-phosphate adenyltransferase],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[G6P degradation],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[F6P degradation],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[FDP degradation],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[GAP degradation],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[DHAP degradation],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PGP degradation],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PG3 degradation],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PG2 degradation],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PEP degradation],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Pyruvate dilution],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[PG dilution],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Ribu5P dilution],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[XYL5P dilution],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[SED7P dilution],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[Rib5P dilution],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[E4P dilution],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Vector=Reactions[GLP dilution],Reference=Flux"/>
        <Object cn="CN=Root,Model=Chassagnole2002_Carbon_Metabolism,Reference=Time"/>
      </Table>
    </Report>
  </ListOfReports>
  <GUI>
  </GUI>
  <SBMLReference file="Chass2002.xml">
    <SBMLMap SBMLid="cadp" COPASIkey="ModelValue_8"/>
    <SBMLMap SBMLid="camp" COPASIkey="ModelValue_9"/>
    <SBMLMap SBMLid="catp" COPASIkey="ModelValue_7"/>
    <SBMLMap SBMLid="cdhap" COPASIkey="Metabolite_63"/>
    <SBMLMap SBMLid="ce4p" COPASIkey="Metabolite_57"/>
    <SBMLMap SBMLid="cf6p" COPASIkey="Metabolite_45"/>
    <SBMLMap SBMLid="cfdp" COPASIkey="Metabolite_51"/>
    <SBMLMap SBMLid="cg1p" COPASIkey="Metabolite_47"/>
    <SBMLMap SBMLid="cg6p" COPASIkey="Metabolite_41"/>
    <SBMLMap SBMLid="cgap" COPASIkey="Metabolite_55"/>
    <SBMLMap SBMLid="cglcex" COPASIkey="Metabolite_39"/>
    <SBMLMap SBMLid="cnad" COPASIkey="ModelValue_12"/>
    <SBMLMap SBMLid="cnadh" COPASIkey="ModelValue_13"/>
    <SBMLMap SBMLid="cnadp" COPASIkey="ModelValue_10"/>
    <SBMLMap SBMLid="cnadph" COPASIkey="ModelValue_11"/>
    <SBMLMap SBMLid="cpep" COPASIkey="Metabolite_37"/>
    <SBMLMap SBMLid="cpg" COPASIkey="Metabolite_49"/>
    <SBMLMap SBMLid="cpg2" COPASIkey="Metabolite_69"/>
    <SBMLMap SBMLid="cpg3" COPASIkey="Metabolite_67"/>
    <SBMLMap SBMLid="cpgp" COPASIkey="Metabolite_65"/>
    <SBMLMap SBMLid="cpyr" COPASIkey="Metabolite_43"/>
    <SBMLMap SBMLid="crib5p" COPASIkey="Metabolite_61"/>
    <SBMLMap SBMLid="cribu5p" COPASIkey="Metabolite_71"/>
    <SBMLMap SBMLid="csed7p" COPASIkey="Metabolite_53"/>
    <SBMLMap SBMLid="cxyl5p" COPASIkey="Metabolite_59"/>
    <SBMLMap SBMLid="cytosol" COPASIkey="Compartment_7"/>
    <SBMLMap SBMLid="extracellular" COPASIkey="Compartment_5"/>
    <SBMLMap SBMLid="vALDO" COPASIkey="Reaction_57"/>
    <SBMLMap SBMLid="vDAHPS" COPASIkey="Reaction_70"/>
    <SBMLMap SBMLid="vDHAP" COPASIkey="Reaction_82"/>
    <SBMLMap SBMLid="vE4P" COPASIkey="Reaction_93"/>
    <SBMLMap SBMLid="vENO" COPASIkey="Reaction_65"/>
    <SBMLMap SBMLid="vEXTER" COPASIkey="Reaction_95"/>
    <SBMLMap SBMLid="vG1PAT" COPASIkey="Reaction_77"/>
    <SBMLMap SBMLid="vG3PDH" COPASIkey="Reaction_61"/>
    <SBMLMap SBMLid="vG6P" COPASIkey="Reaction_78"/>
    <SBMLMap SBMLid="vG6PDH" COPASIkey="Reaction_51"/>
    <SBMLMap SBMLid="vGAP" COPASIkey="Reaction_81"/>
    <SBMLMap SBMLid="vGAPDH" COPASIkey="Reaction_58"/>
    <SBMLMap SBMLid="vGLP" COPASIkey="Reaction_94"/>
    <SBMLMap SBMLid="vMURSyNTH" COPASIkey="Reaction_56"/>
    <SBMLMap SBMLid="vMethSynth" COPASIkey="Reaction_72"/>
    <SBMLMap SBMLid="vPDH" COPASIkey="Reaction_71"/>
    <SBMLMap SBMLid="vPEP" COPASIkey="Reaction_86"/>
    <SBMLMap SBMLid="vPFK" COPASIkey="Reaction_52"/>
    <SBMLMap SBMLid="vPG" COPASIkey="Reaction_92"/>
    <SBMLMap SBMLid="vPG3" COPASIkey="Reaction_84"/>
    <SBMLMap SBMLid="vPGDH" COPASIkey="Reaction_73"/>
    <SBMLMap SBMLid="vPGI" COPASIkey="Reaction_49"/>
    <SBMLMap SBMLid="vPGK" COPASIkey="Reaction_62"/>
    <SBMLMap SBMLid="vPGM" COPASIkey="Reaction_50"/>
    <SBMLMap SBMLid="vPGP" COPASIkey="Reaction_83"/>
    <SBMLMap SBMLid="vPK" COPASIkey="Reaction_66"/>
    <SBMLMap SBMLid="vPPK" COPASIkey="Reaction_76"/>
    <SBMLMap SBMLid="vPTS" COPASIkey="Reaction_48"/>
    <SBMLMap SBMLid="vR5PI" COPASIkey="Reaction_74"/>
    <SBMLMap SBMLid="vRIB5P" COPASIkey="Reaction_88"/>
    <SBMLMap SBMLid="vRibu5p" COPASIkey="Reaction_87"/>
    <SBMLMap SBMLid="vRu5P" COPASIkey="Reaction_75"/>
    <SBMLMap SBMLid="vSED7P" COPASIkey="Reaction_90"/>
    <SBMLMap SBMLid="vSynth1" COPASIkey="Reaction_68"/>
    <SBMLMap SBMLid="vSynth2" COPASIkey="Reaction_69"/>
    <SBMLMap SBMLid="vTA" COPASIkey="Reaction_53"/>
    <SBMLMap SBMLid="vTIS" COPASIkey="Reaction_59"/>
    <SBMLMap SBMLid="vTKA" COPASIkey="Reaction_54"/>
    <SBMLMap SBMLid="vTKB" COPASIkey="Reaction_55"/>
    <SBMLMap SBMLid="vTRPSYNTH" COPASIkey="Reaction_60"/>
    <SBMLMap SBMLid="vXYL5P" COPASIkey="Reaction_89"/>
    <SBMLMap SBMLid="vf6P" COPASIkey="Reaction_79"/>
    <SBMLMap SBMLid="vfdP" COPASIkey="Reaction_80"/>
    <SBMLMap SBMLid="vpepCxylase" COPASIkey="Reaction_67"/>
    <SBMLMap SBMLid="vpg2" COPASIkey="Reaction_85"/>
    <SBMLMap SBMLid="vpyr" COPASIkey="Reaction_91"/>
    <SBMLMap SBMLid="vrpGluMu" COPASIkey="Reaction_64"/>
    <SBMLMap SBMLid="vsersynth" COPASIkey="Reaction_63"/>
  </SBMLReference>
</COPASI>
