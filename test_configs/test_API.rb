
LinkedData.config do |config|
  config.repository_folder  = "/srv/test_bioportal/repository"

    # Deploy the 4store SPARQL server on port 9000
    #4s-httpd -p 9000 -s-1 api_test
  config.goo_host           = "localhost"
  config.goo_port           = 9000

  config.search_server_url  = "http://localhost:8983/solr/core1"
  #config.search_server_url = "http://localhost:8983/solr/term_search_core1"
  config.property_search_server_url = "http://localhost:8983/solr/prop_search_core1"

  # Change rest_url_prefix for test is creating bugs
#  config.rest_url_prefix   = "http://localhost:9393/"

  config.enable_security   = false

  # Redis host
  config.goo_redis_host     = "localhost"
  config.goo_redis_port     = 6381

  config.http_redis_host    = "localhost"
  config.http_redis_port    = 6380

  config.logger   = Logger.new("/srv/logtest.log")
  config.logger.level = Logger.const_get(ENV['LOG_LEVEL'] ? ENV['LOG_LEVEL'].upcase : 'INFO')
end

Annotator.config do |config|
  config.mgrep_dictionary_file   = "/srv/mgrep/mgrep-55555/dictionary.txt"
  config.stop_words_default_file = "./config/default_stop_words.txt"
  config.mgrep_host              = "localhost"
  config.mgrep_port              = 55555
  config.annotator_redis_host    = "localhost"
  config.annotator_redis_port    = 6379
end

NcboCron.config do |config|
  config.ontology_report_path    = "/srv/test_bioportal/ontologies_report.json"
  config.log_path                = "/srv/test_bioportal/test.log"
end

# Ontology_rank should be removed in the next release (it will be calculated on ontologies views)
LinkedData::OntologiesAPI.config do |config|
  config.resolver_redis_host = "localhost"
  config.resolver_redis_port = 6379
  config.ontology_rank = {"GO" => 1000, "GO-EXT" => 999, "NCIT" => 998, "MESH" => 997, "OBI" => 996, "FMA" => 995, "SNOMEDCT" => 994, "NCBITAXON" => 993, "CHEBI" => 992, "CL" => 991, "DOID" => 990, "HP" => 989, "EFO" => 988, "NIFSTD" => 987, "BFO" => 986, "PATO" => 985, "RADLEX" => 984, "PR" => 983, "ENVO" => 982, "ECO" => 981, "MP" => 980, "SO" => 979, "ICD9CM" => 978, "EDAM" => 975, "ABA-AMB" => 974, "LOINC" => 973, "IDO" => 972, "MA" => 971, "UO" => 970, "CBO" => 969, "PAE" => 868, "NPO" => 967, "PO" => 966, "PSDS" => 867, "GRO-CPGA" => 855, "MCCL" => 961, "BAO" => 960, "BTO" => 958, "EVOC" => 957, "NEMO" => 956, "SBO" => 955, "OBOREL" => 954, "NDFRT" => 953, "RXNORM" => 952, "OMIM" => 951, "PW" => 950, "OCRE" => 949, "AMINO-ACID" => 948, "SAO" => 947, "GRO" => 946, "EMAP" => 945, "GRO-CPD" => 944, "BRO" => 942, "GAZ" => 941, "MO" => 940, "NMR" => 939, "CLO" => 938, "ZFA" => 937, "BIRNLEX" => 936, "FB-DV" => 935, "MS" => 934, "EP" => 933, "FBbi" => 932, "PSIMOD" => 931, "DERMLEX" => 930, "CCO" => 929, "MPATH" => 928, "OGMD" => 927, "OGMS" => 926, "OGR" => 925, "BILA" => 924, "COGAT" => 923, "COGPO" => 922, "PPIO" => 921, "AAO" => 920, "FB-BT" => 919, "VO" => 918, "BT" => 917, "FHHO" => 916, "EHDAA" => 915, "IEV" => 914, "XAO" => 913, "MEDDRA" => 912, "MEDLINEPLUS" => 911, "RCD" => 910, "ICPC" => 909, "COSTART" => 908, "WHO-ART" => 907, "PDQ" => 906, "VIVO" => 905, "HL7" => 904, "FAO" => 903, "ATMO" => 902, "WB-LS" => 901, "SWO" => 900, "SNPO" => 899, "WB-PHENOTYPE" => 898, "MAT" => 897, "CPRO" => 896, "BP-METADATA" => 895, "SIO" => 894, "BDO" => 893, "OPL" => 892, "WB-BT" => 891, "REX" => 890, "RS" => 889, "SOPHARM" => 888, "BCGO" => 886, "ACGT-MO" => 885, "OGI" => 884, "PROPREO" => 883, "APO" => 882, "MAO" => 881, "IAO" => 880, "UBERON" => 879, "CPTH" => 878, "ICNP" => 877, "OAE" => 826, "AEO" => 875, "ICD11-BODYSYSTEM" => 874, "ATO" => 873, "TAXRANK" => 872, "NIFDYS" => 871, "NIFCELL" => 870, "HCPCS" => 869, "ECG" => 866, "ICD10" => 865, "ZEA" => 864, "PECO" => 863, "NDDF" => 862, "MDDB" => 861, "AI-RHEUM" => 860, "PTO" => 859, "BSPO" => 858, "SEP" => 857, "CHEMINF" => 856, "TAO" => 854, "OPB" => 853, "TTO" => 852, "FB-SP" => 851, "MIRO" => 850, "SITBAC" => 849, "SPO" => 848, "CDAO" => 847, "XCO" => 846, "TGMA" => 845, "TADS" => 844, "IDOMAL" => 843, "EPILONT" => 842, "MCBCC" => 841, "OMIT" => 840, "HLTHINDCTRS" => 839, "AERO" => 838, "BP" => 837, "LDA" => 836, "HUGO" => 835, "VHOG" => 834, "UNITSONT" => 833, "CPT" => 832, "ICPC2P" => 831, "ICD10CM" => 830, "ICD10PCS" => 829, "CRISP" => 828, "VANDF" => 827, "NBO" => 825, "CPO" => 824, "NEUMORE" => 823, "NIGO" => 822, "SPD" => 821, "WSIO" => 820, "YPO" => 819, "PTRANS" => 818, "CARO" => 817, "CTONT" => 816, "LIPRO" => 815, "PRO-ONT" => 814, "BHO" => 813, "GALEN" => 812, "CPTAC" => 811, "EHDA" => 810, "MHC" => 809, "OGDI" => 808, "MFO" => 807, "IMR" => 806, "pseudo" => 805, "DC-CL" => 804, "FB-CV" => 803, "LHN" => 802, "HOM" => 801, "DDANAT" => 800, "CTCAE" => 799, "OntoOrpha" => 798, "ICF" => 797, "CARELEX" => 796, "FDA-MEDDEVICE" => 795, "PMA" => 794, "PEDTERM" => 793, "ERO" => 792, "GFO-BIO" => 791, "TMO" => 790, "ELIXHAUSER" => 789, "PHARE" => 788, "OMRSE" => 787, "ADW" => 786, "HPIO" => 784, "ICPS" => 783, "NEOMARK3" => 782, "TMA" => 780, "TM-CONST" => 779, "TM-OTHER-FACTORS" => 778, "IDOBRU" => 701, "SDO" => 776, "CANCO" => 775, "SYN" => 774, "CNO" => 773, "HAO" => 772, "GEOSPECIES" => 770, "ONTODM-CORE" => 769, "EHDAA2" => 768, "FLU" => 767, "KISAO" => 766, "DIKB" => 765, "SSO" => 764, "CAO" => 763, "OBOE-SBC" => 761, "DDI" => 760, "PEO" => 759, "PHYFIELD" => 758, "ROLEO" => 756, "SBRO" => 755, "RPO" => 754, "ONTODT" => 753, "RNAO" => 752, "MEGO" => 751, "CCONT" => 750, "TEO" => 749, "MF" => 748, "TOK" => 747, "QIBO" => 746, "DIAGONT" => 745, "NEOMARK4" => 744, "PMR" => 743, "TEDDY" => 742, "CMO" => 741, "EXO" => 740, "ICECI" => 739, "PHYLONT" => 738, "MFOEM" => 737, "INO" => 736, "GFO" => 735, "TM-SIGNS-AND-SYMPTS" => 734, "PVONTO" => 732, "REPO" => 731, "SHR" => 730, "CHEMBIO" => 729, "TM-MER" => 728, "JERM" => 727, "MMO" => 726, "CO-WHEAT" => 725, "IMGT-ONTOLOGY" => 724, "IXNO" => 723, "PLATSTG" => 722, "BIOMODELS" => 719, "SPTO" => 718, "SOY" => 717, "FYPO" => 716, "VT" => 715, "OOEVV" => 714, "NATPRO" => 713, "PHENX" => 712, "CTX" => 709, "MIXSCV" => 708, "NONRCTO" => 707, "RCTONT" => 706, "ONTOMA" => 705, "NIFSUBCELL" => 703, "VSO" => 700, "OBIWS" => 699, "MDCDRG" => 697, "LSM" => 694, "ONSTR" => 693, "RH-MESH" => 692, "I2B2-PATVISDIM" => 691, "EMO" => 689, "HOMERUN" => 688, "DWC-TEST" => 683, "CPT-KM" => 676, "CLINIC" => 674, "ATC" => 672, "GCC" => 670, "DEMOGRAPH" => 666, "UCSFEPIC" => 663, "ICD9CM-KM" => 658, "UCSFICU" => 656, "MEDABBS" => 655, "USSOC" => 654, "UCSFORTHO" => 653, "OSHPD" => 650, "HOM-TEST" => 646, "UCSFXPLANT" => 644, "EPICMEDS" => 642, "ICDO3" => 641, "PCO" => 636, "CONSENT-ONT" => 634, "PROVO" => 633, "NHDS" => 630, "CMS" => 628, "NTDO" => 627, "ONTOKBCF" => 625, "GENETRIAL" => 623, "SWEET" => 622, "GLOB" => 619, "GLYCO" => 618, "QUDT" => 617, "ONTODM-KDD" => 616, "IMMDIS" => 614, "BRIDG" => 613, "GEXO" => 612, "REXO" => 611, "RETO" => 610, "CLIN-EVAL" => 609, "VSAO" => 608, "MIRNAO" => 607, "FIX" => 606, "SYMP" => 605, "VARIO" => 604}
  config.restrict_download = ["ACR0", "ACR1", "ACR2"]
end
