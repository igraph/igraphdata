# Koenigsberg snapshot

    Code
      Koenigsberg
    Output
      IGRAPH UN-- 4 7 -- The seven bidges of Koenigsberg
      + attr: name (g/c), name (v/c), Euler_letter (v/c), Euler_letter (e/c),
      | name (e/c)
      + edges (vertex names):
      [1] Altstadt-Loebenicht--Kneiphof          
      [2] Altstadt-Loebenicht--Kneiphof          
      [3] Altstadt-Loebenicht--Lomse             
      [4] Kneiphof           --Lomse             
      [5] Vorstadt-Haberberg --Lomse             
      [6] Kneiphof           --Vorstadt-Haberberg
      [7] Kneiphof           --Vorstadt-Haberberg

# UKfaculty snapshot

    Code
      UKfaculty
    Output
      IGRAPH D-W- 81 817 -- 
      + attr: Type (g/c), Date (g/c), Citation (g/c), Author (g/c), Group
      | (v/n), weight (e/n)
      + edges:
       [1] 57->52 76->42 12->69 43->34 28->47 58->51  7->29 40->71  5->37 48->55
      [11]  6->58 21-> 8 28->69 43->21 67->58 65->42  5->67 52->75 37->64  4->36
      [21] 12->49 19->46 37-> 9 74->36 62-> 1 15-> 2 72->49 46->62  2->29 40->12
      [31] 22->29 71->69  4-> 3 37->69  5-> 6 77->13 23->49 52->35 20->14 62->70
      [41] 34->35 76->72  7->42 37->42 51->80 38->45 62->64 36->53 62->77 17->61
      [51]  7->68 46->29 44->53 18->58 12->16 72->42 52->32 58->21 38->17 15->51
      [61] 22-> 7 22->69  5->13 29-> 2 77->12 37->35 18->46 10->71 22->47 20->19
      + ... omitted several edges

# USairports snapshot

    Code
      USairports
    Output
      IGRAPH DN-- 755 23473 -- US airports
      + attr: name (g/c), name (v/c), City (v/c), Position (v/c), Carrier
      | (e/c), Departures (e/n), Seats (e/n), Passengers (e/n), Aircraft
      | (e/n), Distance (e/n)
      + edges (vertex names):
       [1] BGR->JFK BGR->JFK BOS->EWR ANC->JFK JFK->ANC LAS->LAX MIA->JFK EWR->ANC
       [9] BJC->MIA MIA->BJC TEB->ANC JFK->LAX LAX->JFK LAX->SFO AEX->LAS BFI->SBA
      [17] ELM->PIT GEG->SUN ICT->PBI LAS->LAX LAS->PBI LAS->SFO LAX->LAS PBI->AEX
      [25] PBI->ICT PIT->VCT SFO->LAX VCT->DWH IAD->JFK ABE->CLT ABE->HPN AGS->CLT
      [33] AGS->CLT AVL->CLT AVL->CLT AVP->CLT AVP->PHL BDL->CLT BHM->CLT BHM->CLT
      [41] BNA->CLT BNA->CLT BNA->DCA BNA->PHL BTR->CLT BUF->CLT BUF->DCA BUF->PHL
      + ... omitted several edges

# enron snapshot

    Code
      enron
    Output
      IGRAPH D--- 184 125409 -- Enron email network
      + attr: LDC_names (g/c), LDC_desc (g/c), name (g/c), Citation (g/c),
      | Email (v/c), Name (v/c), Note (v/c), Time (e/c), Reciptype (e/c),
      | Topic (e/n), LDC_topic (e/n)
      + edges:
       [1]  25->154  25->154  30-> 30  30-> 30  30-> 30  30-> 30  39-> 39  52-> 67
       [9]  52-> 67  52-> 67  52-> 67  61->100  61->100  61->163  61->163  61->166
      [17]  61->166  61->170  64-> 59  64-> 59  64-> 64  64-> 64  64->147  64->147
      [25]  64->164  64->164  64->168  66-> 66  66-> 66  67->129  67->129  67->129
      [33]  67->129  93-> 10  93-> 10  93-> 10  93-> 10  93-> 39  93-> 39  93-> 93
      [41]  93-> 93  93-> 93  93-> 93  93->124  93->124 100-> 61 100-> 61 115->115
      + ... omitted several edges

# foodwebs snapshot

    Code
      foodwebs
    Output
      $ChesLower
      IGRAPH DNW- 37 178 -- Lower Chesapeake Bay in Summer
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input    ->Net Phytoplankton  Input    ->Picoplankton      
       [3] Input    ->Microphytobenthos  Input    ->SAV               
       [5] Input    ->Oysters            Input    ->Blue Crab         
       [7] Input    ->Herrings and Shads Input    ->White Perch       
       [9] Input    ->Spot               Input    ->American eel      
      [11] Input    ->Catfish            Input    ->DOC               
      [13] Input    ->Sediment POC       Oysters  ->Output            
      + ... omitted several edges
      
      $ChesMiddle
      IGRAPH DNW- 37 209 -- Middle Chesapeake Bay in Summer
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input    ->Net Phytoplankton          Input    ->Picoplankton              
       [3] Input    ->Microphytobenthos          Input    ->SAV                       
       [5] Input    ->Deposit Feeding Benthos    Input    ->Suspension Feeding Benthos
       [7] Input    ->Oysters                    Input    ->Blue Crab                 
       [9] Input    ->Herrings and Shads         Input    ->American eel              
      [11] Input    ->Sediment POC               Oysters  ->Output                    
      [13] Blue Crab->Output                     Menhaden ->Output                    
      + ... omitted several edges
      
      $ChesUpper
      IGRAPH DNW- 37 215 -- Upper Chesapeake Bay in Summer
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input      ->Net Phytoplankton Input      ->Picoplankton     
       [3] Input      ->Microphytobenthos Input      ->SAV              
       [5] Input      ->Oysters           Input      ->Blue Crab        
       [7] Input      ->American Eel      Input      ->DOC              
       [9] Input      ->Sediment POC      Input      ->POC              
      [11] Oysters    ->Output            Blue Crab  ->Output           
      [13] Menhaden   ->Output            Bay anchovy->Output           
      + ... omitted several edges
      
      $Chesapeake
      IGRAPH DNW- 39 177 -- Chesapeake Bay Mesohaline Network
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input                 ->phytoplankton            
       [2] Input                 ->benthic diatoms          
       [3] Input                 ->dissolved organic carbon 
       [4] Input                 ->suspended particulate org
       [5] zooplankton           ->Output                   
       [6] mya arenaria          ->Output                   
       [7] oysters               ->Output                   
      + ... omitted several edges
      
      $CrystalC
      IGRAPH DNW- 24 125 -- Crystal River Creek (Control)
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input                ->macrophytes    Input                ->bay anchovy   
       [3] Input                ->needlefish     Input                ->gulf killifish
       [5] Input                ->pinfish        zooplankton          ->Output        
       [7] benthic invertebrates->Output         blacktip shark       ->Output        
       [9] stingray             ->Output         striped anchovy      ->Output        
      [11] bay anchovy          ->Output         needlefish           ->Output        
      [13] sheepshead killifish ->Output         goldspotted killifish->Output        
      + ... omitted several edges
      
      $CrystalD
      IGRAPH DNW- 24 100 -- Crystal River Creek (Delta Temp)
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input                ->macrophytes Input                ->pinfish    
       [3] macrophytes          ->Output      zooplankton          ->Output     
       [5] benthic invertebrates->Output      bay anchovy          ->Output     
       [7] catfish              ->Output      needlefish           ->Output     
       [9] goldspotted killifish->Output      gulf killifish       ->Output     
      [11] longnosed killifish  ->Output      molly                ->Output     
      [13] silverside           ->Output      moharra              ->Output     
      + ... omitted several edges
      
      $Maspalomas
      IGRAPH DNW- 24 82 -- Charca de Maspalomas
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input              ->Cyanobacteria    Input              ->Eukaryotic Phyto
       [3] Input              ->Chara globularis Input              ->Ruppia Maritima 
       [5] Input              ->Cladophora       Input              ->Periphyton      
       [7] Gallinula chloropus->Output           DOC                ->Output          
       [9] Sedimented POC     ->Output           Cyanobacteria      ->Respiration     
      [11] Eukaryotic Phyto   ->Respiration      Chara globularis   ->Respiration     
      [13] Ruppia Maritima    ->Respiration      Cladophora         ->Respiration     
      + ... omitted several edges
      
      $Michigan
      IGRAPH DNW- 39 221 -- Lake Michigan Control network
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input          ->Flagellates    Input          ->Blue-greenGree
       [3] Input          ->Diatoms        Input          ->Bythotrephes  
       [5] Input          ->Zebra mussels  Bythotrephes   ->Output        
       [7] Zebra mussels  ->Output         Bloater        ->Output        
       [9] Rainbow smelt  ->Output         Slimy sculpin  ->Output        
      [11] Deepwater sculp->Output         Lake Whitefish ->Output        
      [13] Yellow perch   ->Output         Burbot         ->Output        
      + ... omitted several edges
      
      $Mondego
      IGRAPH DNW- 46 400 -- Mondego Estuary - Zostrea site
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input          ->Phytoplankton        Input          ->Enteromorpha sp     
       [3] Input          ->Ulva lactuca         Input          ->Zostera             
       [5] Input          ->Epiphytes            Input          ->Gracilaria          
       [7] Input          ->Macrofauna predators Input          ->Larus ridibundus    
       [9] Input          ->Larus fuscus         Detritus       ->Output              
      [11] Phytoplankton  ->Respiration          Enteromorpha sp->Respiration         
      [13] Ulva lactuca   ->Respiration          Zostera        ->Respiration         
      + ... omitted several edges
      
      $Narragan
      IGRAPH DNW- 35 220 -- Narragansett Bay Model
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input          ->Benthic Alage Input          ->Phytoplankton
       [3] Input          ->Detritus      Bluefish       ->Output       
       [5] Striped Bass   ->Output        Winter Flounder->Output       
       [7] Windowpane     ->Output        Scup           ->Output       
       [9] Tautog         ->Output        Dogfish        ->Output       
      [11] Skates         ->Output        Longfin Squid  ->Output       
      [13] Butterfish     ->Output        Menhaden       ->Output       
      + ... omitted several edges
      
      $Rhode
      IGRAPH DNW- 20 53 -- Rhode River Watershed - Water Budget
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input->crop land                 Input->pasture land             
       [3] Input->upland forest             Input->riparian forest adj. crop
       [5] Input->riparian forest adj. past Input->riparian forest adj. upla
       [7] Input->flooded swamp forest      Input->herbaceous wetland       
       [9] Input->floodplain forest         Input->low marsh adj. north fork
      [11] Input->low marsh adj. main fork  Input->muddy creek              
      [13] Input->mud flat                  Input->high marsh               
      + ... omitted several edges
      
      $StMarks
      IGRAPH DNW- 54 356 -- St. Marks River (Florida) Flow network
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input->Phytoplankton            Input->Halodule                
       [3] Input->Micro-epiphytes          Input->Macro-epiphytes         
       [5] Input->Benthic algae            Input->Zooplankton             
       [7] Input->Epiphyte-graz amphipods  Input->suspension-feed molluscs
       [9] Input->Suspension-feed polychts Input->Benthic bact            
      [11] Input->Microfauna               Input->Deposit feed amphipods  
      [13] Input->Herbivorous shrimp       Input->Deposit-feed gastropod  
      + ... omitted several edges
      
      $baydry
      IGRAPH DNW- 128 2137 -- Florida Bay Trophic Exchange Matrix, dry season
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input->2um Spherical Phytoplankt Input->Synedococcus             
       [3] Input->Oscillatoria              Input->Small Diatoms (<20um)    
       [5] Input->Big Diatoms (>20um)       Input->Dinoflagellates          
       [7] Input->Other Phytoplankton       Input->Benthic Phytoplankton    
       [9] Input->Thalassia                 Input->Halodule                 
      [11] Input->Syringodium               Input->Roots                    
      [13] Input->Drift Algae               Input->Epiphytes                
      + ... omitted several edges
      
      $baywet
      IGRAPH DNW- 128 2106 -- Florida Bay Trophic Exchange Matrix, wet season
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input->2um Spherical Phytoplankt Input->Synedococcus             
       [3] Input->Oscillatoria              Input->Small Diatoms (<20um)    
       [5] Input->Big Diatoms (>20um)       Input->Dinoflagellates          
       [7] Input->Other Phytoplankton       Input->Benthic Phytoplankton    
       [9] Input->Thalassia                 Input->Halodule                 
      [11] Input->Syringodium               Input->Roots                    
      [13] Input->Drift Algae               Input->Epiphytes                
      + ... omitted several edges
      
      $cypdry
      IGRAPH DNW- 71 640 -- Cypress Dry Season
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input->Living POC            Input->Phytoplankton        
       [3] Input->Float. vegetation     Input->Periphyton/Macroalgae
       [5] Input->Macrophytes           Input->Epiphytes            
       [7] Input->Understory            Input->Vine Leaves          
       [9] Input->Hardwoods Leaves      Input->Cypress Leaves       
      [11] Input->Cypress Wood          Input->HW Wood              
      [13] Input->Roots                 Input->Egrets               
      + ... omitted several edges
      
      $cypwet
      IGRAPH DNW- 71 631 -- Cypress Wet Season
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input->Living POC      Input->Phytoplankton   Input->Float Veg.     
       [4] Input->Periphyton      Input->Macrophytes     Input->Epiphytes      
       [7] Input->Understory      Input->Vine L          Input->Hardwood L     
      [10] Input->Cypress L       Input->Cypress W       Input->Hardwood W     
      [13] Input->Roots           Input->Egrets          Input->GB Heron       
      [16] Input->Other Herons    Input->Wood stork      Input->White ibis     
      [19] Input->Refractory Det. Input->Liable Det.    
      + ... omitted several edges
      
      $gramdry
      IGRAPH DNW- 69 915 -- Everglades Graminoids - Dry Season
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input                ->Periphyton    Input                ->Macrophytes  
       [3] Input                ->Utricularia   Input                ->Floating Veg.
       [5] Input                ->Lizards       Apple snail          ->Output       
       [7] Freshwater Prawn     ->Output        Mesoinverts          ->Output       
       [9] Other Macroinverts   ->Output        Large Aquatic Insects->Output       
      [11] Gar                  ->Output        Shiners & Minnows    ->Output       
      [13] Chubsuckers          ->Output        Catfish              ->Output       
      + ... omitted several edges
      
      $gramwet
      IGRAPH DNW- 69 916 -- Everglades Graminoids - Wet Season
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input                ->Periphyton    Input                ->Macrophytes  
       [3] Input                ->Utricularia   Input                ->Floating Veg.
       [5] Input                ->Lizards       Living POC           ->Output       
       [7] Apple snail          ->Output        Freshwater Prawn     ->Output       
       [9] Mesoinverts          ->Output        Other Macroinverts   ->Output       
      [11] Large Aquatic Insects->Output        Gar                  ->Output       
      [13] Shiners & Minnows    ->Output        Chubsuckers          ->Output       
      + ... omitted several edges
      
      $mangdry
      IGRAPH DNW- 97 1491 -- Mangrove Estuary, Dry Season
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input->PHY      Input->OTH. PP  Input->LEAF     Input->WOOD    
       [5] Input->ROOT     Input->MERO     Input->L & G    Input->PELC    
       [9] Input->CORM     Input->BH & E   Input->SE & E   Input->IBIS    
      [13] Input->DUCK1    Input->DUCK2    Input->DUCK3    Input->VULT    
      [17] Input->K & H    Input->MRAPT    Input->GUIF     Input->SSBIRDS 
      [21] Input->G & T    Input->C & C    Input->OWLS     Input->WOODP   
      [25] Input->PASSOMN  Input->PASSPERD Input->POC      Input->DOC     
      + ... omitted several edges
      
      $mangwet
      IGRAPH DNW- 97 1492 -- Mangrove Estuary, Wet Season
      + attr: Citation (g/c), Author (g/c), URL (g/c), name (g/c), name
      | (v/c), ECO (v/n), Biomass (v/n), weight (e/n)
      + edges (vertex names):
       [1] Input->PHY      Input->OTH. PP  Input->LEAF     Input->WOOD    
       [5] Input->ROOT     Input->MERO     Input->L & G    Input->PELC    
       [9] Input->CORM     Input->BH & E   Input->SE & E   Input->IBIS    
      [13] Input->DUCK1    Input->DUCK2    Input->DUCK3    Input->VULT    
      [17] Input->K & H    Input->MRAPT    Input->GUIF     Input->SSBIRDS 
      [21] Input->G & T    Input->C & C    Input->OWLS     Input->WOODP   
      [25] Input->PASSOMN  Input->PASSPERD Input->POC      Input->DOC     
      + ... omitted several edges
      

# immuno snapshot

    Code
      immuno
    Output
      IGRAPH U--- 1316 6300 -- immunoglobuline network
      + attr: name (g/c), Citation (g/c), Author (g/c)
      + edges:
       [1]  1--  2  1--  3  1-- 94  1-- 95  1-- 97  2--  3  2--  4  2-- 25  2-- 26
      [10]  2-- 27  2-- 97  3--  4  3--  5  3-- 25  3-- 26  3-- 97  3-- 98  3-- 99
      [19]  4--  5  4--  6  4-- 23  4-- 24  4-- 25  4-- 26  4-- 88  4-- 89  4-- 90
      [28]  4-- 97  4-- 98  4-- 99  4--100  5--  6  5--  7  5-- 23  5-- 24  5-- 25
      [37]  5-- 99  5--100  6--  7  6--  8  6--  9  6-- 21  6-- 22  6-- 23  6-- 24
      [46]  6-- 87  6-- 88  6-- 99  6--100  6--101  6--102  7--  8  7--  9  7-- 21
      [55]  7-- 22  7-- 23  7--101  7--102  8--  9  8-- 10  8-- 11  8-- 21  8-- 22
      [64]  8--102  9-- 10  9-- 11  9--101  9--102  9--103 10-- 11 10-- 12 10--102
      + ... omitted several edges

# karate snapshot

    Code
      karate
    Output
      IGRAPH UNW- 34 78 -- Zachary's karate club network
      + attr: name (g/c), Citation (g/c), Author (g/c), Faction (v/n), name
      | (v/c), label (v/c), color (v/n), weight (e/n)
      + edges (vertex names):
       [1] Mr Hi  --Actor 2  Mr Hi  --Actor 3  Mr Hi  --Actor 4  Mr Hi  --Actor 5 
       [5] Mr Hi  --Actor 6  Mr Hi  --Actor 7  Mr Hi  --Actor 8  Mr Hi  --Actor 9 
       [9] Mr Hi  --Actor 11 Mr Hi  --Actor 12 Mr Hi  --Actor 13 Mr Hi  --Actor 14
      [13] Mr Hi  --Actor 18 Mr Hi  --Actor 20 Mr Hi  --Actor 22 Mr Hi  --Actor 32
      [17] Actor 2--Actor 3  Actor 2--Actor 4  Actor 2--Actor 8  Actor 2--Actor 14
      [21] Actor 2--Actor 18 Actor 2--Actor 20 Actor 2--Actor 22 Actor 2--Actor 31
      [25] Actor 3--Actor 4  Actor 3--Actor 8  Actor 3--Actor 9  Actor 3--Actor 10
      + ... omitted several edges

# kite snapshot

    Code
      kite
    Output
      IGRAPH UN-- 10 18 -- Krackhardt's kite
      + attr: name (g/c), layout (g/n), Citation (g/c), Author (g/c), URL
      | (g/c), label (v/c), Firstname (v/c), name (v/c)
      + edges (vertex names):
       [1] A--B A--C A--D A--F B--D B--E B--G C--D C--F D--E D--F D--G E--G F--G F--H
      [16] G--H H--I I--J

# macaque snapshot

    Code
      macaque
    Output
      IGRAPH DN-- 45 463 -- 
      + attr: Citation (g/c), Author (g/c), shape (v/c), name (v/c)
      + edges (vertex names):
       [1] V1 ->V2     V1 ->V3     V1 ->V3A    V1 ->V4     V1 ->V4t    V1 ->MT    
       [7] V1 ->PO     V1 ->PIP    V2 ->V1     V2 ->V3     V2 ->V3A    V2 ->V4    
      [13] V2 ->V4t    V2 ->VOT    V2 ->VP     V2 ->MT     V2 ->MSTd/p V2 ->MSTl  
      [19] V2 ->PO     V2 ->PIP    V2 ->VIP    V2 ->FST    V2 ->FEF    V3 ->V1    
      [25] V3 ->V2     V3 ->V3A    V3 ->V4     V3 ->V4t    V3 ->MT     V3 ->MSTd/p
      [31] V3 ->PO     V3 ->LIP    V3 ->PIP    V3 ->VIP    V3 ->FST    V3 ->TF    
      [37] V3 ->FEF    V3A->V1     V3A->V2     V3A->V3     V3A->V4     V3A->VP    
      [43] V3A->MT     V3A->MSTd/p V3A->MSTl   V3A->PO     V3A->LIP    V3A->DP    
      + ... omitted several edges

# rfid snapshot

    Code
      rfid
    Output
      IGRAPH U--- 75 32424 -- RFID hospital encounter network
      + attr: name (g/c), Citation (g/c), Status (v/c), Time (e/n)
      + edges:
       [1] 15--31 15--22 15--16 15--16 16--22 16--22 16--22 16--22 16--22 11--16
      [11] 11--22 11--22 11--22 11--22 11--22 11--22 11--22 11--22 11--22 11--22
      [21] 11--22 15--16 11--22 11--16 15--16 11--16 15--16 11--16 11--16 14--22
      [31] 14--22 14--22  3--37  3--37 15--22 15--22 15--22  3--37  3--37  5--37
      [41]  3--37  3-- 6  3--37  5-- 7  5-- 7  5--37  1--20  3-- 5  3--37  1--17
      [51]  3--37  8--17 17--37 31--37  3--37  5--17  8--17  8--37  5--31  8--17
      [61]  5--31  6--37 23--31  5--31  8--17  5--23 23--37 10--13  5--31  1-- 6
      [71]  8--17  5--37 23--37  8--23 17--23  8--17 23--37  8--23 17--37 17--23
      + ... omitted several edges

# yeast snapshot

    Code
      yeast
    Output
      IGRAPH UN-- 2617 11855 -- Yeast protein interactions, von Mering et al.
      + attr: name (g/c), Citation (g/c), Author (g/c), URL (g/c), Classes
      | (g/x), name (v/c), Class (v/c), Description (v/c), Confidence (e/c)
      + edges (vertex names):
       [1] YLR197W--YDL014W YOR039W--YOR061W YDR473C--YPR178W YOR332W--YLR447C
       [5] YER090W--YKL211C YDR394W--YGR232W YER021W--YPR108W YPR029C--YKL135C
       [9] YIL106W--YGR092W YKL166C--YIL033C YGL026C--YKL211C YOR061W--YGL019W
      [13] YGL115W--YER027C YGL049C--YGR162W YDR394W--YOR117W YDL140C--YML010W
      [17] YLR291C--YKR026C YGR158C--YDL111C YDR328C--YDL132W YOL094C--YNL290W
      [21] YDR460W--YPR025C YBR154C--YOR341W YBR154C--YOR116C YIL062C--YKL013C
      [25] YBR154C--YOR207C YBR154C--YPR010C YER027C--YDR477W YLR291C--YGR083C
      + ... omitted several edges

