


include <OPSC-base.scad>
include <DYSON-library.scad>
include <RYOBI-library.scad>



OPSCbuild(shift=200);

// ZZZZ
// Description
module draw1(){    
    color="yellow";
    drawAdapter(color, "V1");
}

// ZZZZ
// Description
module draw2(){
    color="orange";
    drawAdapter(color, "V2");
}


module drawAdapter(color, ver){
    translate([0,0,100]){
        testing = false;
        difference(){
            //postive portion
            
            union(){            
    //////adapterMain oi
                oii("cubeRounded",str("adapterMain",ver),color);            
    //////adapterMainFrontExtension oi
                oii("cubeRounded",str("adapterMainFrontExtension",ver),color);
            }
            //negative portion
            union(){     
                adapterNegativeBits(color,ver);
            }
        }
        adapterAddBackBits(color,ver);
        intersection(){
    //////adapterainBatteryStemMask oi
                oii("cubeRounded","adapterMainBatteryStemMask",color);
                oiiiDyson("dysonV6Battery",str("dysonShift",ver),color);     /////
        }


        if(testing){
            debugBits("blue",ver);
        }
    }
}



module debugBits(color, ver){    
    //////ryobiBatteryShift oiii insert            
        oiiiRyobi("ryobiBattery",str("ryobiBatteryShift",ver),color);     ////ASSEMBLY
    //////dysonShift oiii insert    
        oiiiDyson("dysonV6Handle",str("dysonShift",ver),color);     ////ASSEMBLY
        oiiiDyson("dysonV6DustBin",str("dysonShift",ver),color);     ////ASSEMBLY
}

module adapterNegativeBits(color, ver){
//////testWireHole oi
//////testWireHoleFront oii insert
            if(ver == "V1"){
                oii("cylinder","testWireHoleFront",color);  
                oii("cylinder","testWireHoleRear",color); 
            }else if(ver == "V2"){
                oii("cylinder","testWireHoleV2",color); 
            }
            oiiiDyson("dysonHandleClearance",str("dysonShift",ver),color);     ////
            oiiiDyson("dysonV6Handle",str("dysonShift",ver),color);     ////
            oiiiDyson("dysonV6DustBin",str("dysonShift",ver),color);     ////
            //oiiiDyson("dysonV6Battery",str("dysonShift",ver),color);     ////
            oiiiDyson("dysonV6FrontScrewNegative",str("dysonShift",ver),color);     ////
            oiiiDyson("dysonV6batteryTerminalSingle",str("dysonShift",ver),color);     ////
            oiiiRyobi("ryobiBattery",str("ryobiBatteryShift",ver),color,ex=2);     ////


}

module adapterAddBackBits(color, ver){
    //////adding things back
    oiiiRyobi("ryobiBatteryClips",str("ryobiBatteryShift",ver),color);     
}



dewaltShift = 4;
// ZZZZ
// Description
module draw3(){
    color="yellow";
    intersection(){
        oi("cube",width=1000,height=1000,depth=1000,z=1000-dewaltShift,color=color);
        dewaltAdapterV1(color);
    }   
}


// ZZZZ
// Description
module draw4(){
    color="yellow";
    intersection(){
        oi("cube",width=1000,height=1000,depth=1000,z=-dewaltShift,color=color);
        dewaltAdapterV1(color);
    }   
}    

module dewaltAdapterV1(color){
difference(){
        //postive portion
        union(){            
//////dewaltMainV1 oi
            oii("cubeRounded","dewaltMainV1",color);
        }
        //negative portion
        union(){
            oiii("dewaltBatteryHolder","dewaltBatteryHolder",color);
            //oiiD("dysonHandleClearance","",color);
            oiiiDyson("dysonV6DustBinSimple",str("dysonShift",1),color);
//////dewaltCarcass oi
            oiii("dysonCarcassCutout","dysonCarcass",color);
            oiii("dysonChargeBoardV6","dysonChargeBoard",color);             
//////dewaltMainHoleA oi
            oii("holeM6","dewaltMainHoleA",color);           
            oii("holeM6","dewaltMainHoleB",color);           
            oii("holeM6","dewaltMainHoleC",color);           
            oii("holeM6","dewaltMainHoleD",color);           
        }
    }
}


// ZZZZ
// Description
module draw5(){
    color="blue";
    
}

// ZZZZ
// Description
module draw6(){
    color="purple";
    
}

// ZZZZ
// Description
module draw7(){
    color="gray";
    
}

// ZZZZ
// Description
module draw8(){
    color="white";
}

// ZZZZ
// Description
module draw9(){
    color="black";
}

// ZZZZ
// Description
module draw10(){
    color="pink";
}



module test(){
    //OPSCInsert("OSPCHole",100,0,0);
    //OPSCInsert("holeM3");
    //OPSCInsert("OPSCHoleSlot",x=50,rad=5,rotZ=45);
    //OPSCInsert("M3SocketHeadFull",0,0,0);
    //OPSCInsert("M3SocketHead",0,0,0,length=25);
    //OPSCInsert("cubeRounded",width=20,height=20,depth=6,rad=5);
   //OPSCInsert("cylinder",rad=20,depth=6); //OPSCInsert("cube",width=20,height=20,depth=6,rad=5,alpha=0.3,color="red");
    
}

module ZZZZinsert(item,x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=0,rad=0,color="gray",alpha=1,clearance=0,offset=0){
    color(color,alpha){
            translate([x,y,z]){
                rotate([rotX,rotY,rotZ]){    
                    if(item=="OPSCtest"){
                }
            }
        }
    }
}

module draw(color){
    difference(){
////////////positive portions
        union(){

        }
////////////negative portions        
        union(){

        }

    }

}

module oiii(type,name,color){
   oii(type,x=gvv(str(name,"X")),y=gvv(str(name,"Y")),z=gvv(str(name,"Z")),rotX=gvv(str(name,"RotX")),rotY=gvv(str(name,"RotY")),rotZ=gvv(str(name,"RotZ")),color=color); 
}

module oiiiRyobi(type,name,color,ex=0){
   oiiR(type,x=gvv(str(name,"X")),y=gvv(str(name,"Y")),z=gvv(str(name,"Z")),rotX=gvv(str(name,"RotX")),rotY=gvv(str(name,"RotY")),rotZ=gvv(str(name,"RotZ")),color=color,ex=ex); 
}

module oiiiDyson(type,name,color){
   oiiD(type,x=gvv(str(name,"X")),y=gvv(str(name,"Y")),z=gvv(str(name,"Z")),rotX=gvv(str(name,"RotX")),rotY=gvv(str(name,"RotY")),rotZ=gvv(str(name,"RotZ")),color=color); 
}

module oii(type,name,color="gray",x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,alpha=1,OOwidth=0,OOheight=0,holes=true,negative=true){
    color(color,alpha){
        translate([x,y,z]){
                rotate([rotX,rotY,rotZ]){
                    if(type=="TEST"){
                        t = 0;
                    }else if(type=="TEST2"){
                        t = 0; 
                    }
//@@@@@@testWireHole Asembly                                            
                    else if(type=="testWireHole"){
                        difference(){                    
                            //postive portion                        
                            union(){   
                                oii("cylinder","testWireHole",color);                         
                            }                            
                            //negative portion                            
                            union(){                            
                            }                            
                        }                            
                    }
////////////////////////////////////
////////////      Dyson Stuff

//@@@@@@dysonChargeBoardV6 Asembly
                    else if(type=="dysonChargeBoardV6"){
                        difference(){                    
                            //postive portion                        
                            union(){
//////dysonChargeBoardSquare oi
                                oii("cube","dysonChargeBoardSquare",color);
                                oii("cube","dysonChargeBoardClearanceA",color);  
                                oii("nutM3","dysonChargeBoardClearanceB",color);                                
                                oii("holeM3","dysonChargeBoardHole",color);                            
                                oii("nutM3","dysonChargeBoardHole",color);                            
                            }                            
                            //negative portion                            
                            union(){
//////dysonChargeBoardHole oi
                                
                            }                            
                        }                            
                    }

//@@@@@@dysonCarcassCutout Asembly                                            
                    else if(type=="dysonCarcassCutout"){
                        difference(){                    
                            //postive portion                        
                            union(){ 
//////dewaltCarcassTop oi
                                oii("cube","dysonCarcassTop",color);  
//////dewaltCarcassBottom oi
                                oii("cube","dysonCarcassBottom",color);                         
                            }                            
                            //negative portion                            
                            union(){                            
                            }                            
                        }                            
                    }                        
////////////////////////////////////
////////////      DeWalt Stuff

//@@@@@@dewaltBatteryHolder Asembly                    
                    else if(type=="dewaltBatteryHolder"){
                        difference(){                    
                            //postive portion                        
                            union(){ 
//////dewaltBatteryHolderMain oi
                                oii("cube","dewaltBatteryHolderMain",color);    
//////dewaltBatteryHolderWireClearance oi
                                oii("cube","dewaltBatteryHolderWireClearance",color);                       
//////dewaltBatteryHolderHoleA oi
                                oii("holeM3","dewaltBatteryHolderHoleA",color);     
                                oii("capscrewM3","dewaltBatteryHolderHoleA",color);     
//////dewaltBatteryHolderHoleB oi
                                oii("holeM3","dewaltBatteryHolderHoleB",color);                    
                                oii("capscrewM3","dewaltBatteryHolderHoleB",color);  
                            }                            
                            //negative portion                            
                            union(){                                   
                            }                            
                        }                            
                    }                                            
                    else{    
                        oi(type,x=gvv(str(name,"X")),y=gvv(str(name,"Y")),z=gvv(str(name,"Z")),width=gvv(str(name,"W")),height=gvv(str(name,"H")),depth=gvv(str(name,"D")),rad=gvv(str(name,"Radius")),rotX=gvv(str(name,"RotX")),rotY=gvv(str(name,"RotY")),rotZ=gvv(str(name,"RotZ")),color=color,name=name);
                    }
                        
                }
        }
    }
}
function gvv(name) =
name=="TEST" ? "TEST":
////////////Shift Variables
//////ryobiBatteryShift coordinates'
    name=="ryobiBatteryShiftV1X"      ? 22 :
    name=="ryobiBatteryShiftV1Y"      ? 0 :    
    name=="ryobiBatteryShiftV1Z"      ? 36 :    
    name=="ryobiBatteryShiftV1RotX"       ? 0 :    
    name=="ryobiBatteryShiftV1RotY"       ? 0 :    
    name=="ryobiBatteryShiftV1RotZ"       ? 0 :    
//////dysonShift coordinates'o    
    name=="dysonShiftV1X"     ? 0 :
    name=="dysonShiftV1Y"     ? 0 :    
    name=="dysonShiftV1Z"     ? 0 :    
    name=="dysonShiftV1RotX"      ? 0 :    
    name=="dysonShiftV1RotY"      ? 0 :    
    name=="dysonShiftV1RotZ"      ? 0 :  
//////ryobiBatteryShift coordinates'
    name=="ryobiBatteryShiftV2X"      ? -50 :
    name=="ryobiBatteryShiftV2Y"      ? -40 :    
    name=="ryobiBatteryShiftV2Z"      ? 36 :    
    name=="ryobiBatteryShiftV2RotX"       ? 0 :    
    name=="ryobiBatteryShiftV2RotY"       ? 0 :    
    name=="ryobiBatteryShiftV2RotZ"       ? -90 :    
//////dysonShift coordinates'o    
    name=="dysonShiftV2X"     ? 0 :
    name=="dysonShiftV2Y"     ? 0 :    
    name=="dysonShiftV2Z"     ? 0 :    
    name=="dysonShiftV2RotX"      ? 0 :    
    name=="dysonShiftV2RotY"      ? 0 :    
    name=="dysonShiftV2RotZ"      ? 0 :      
//////adapterMain dimensions'    
name=="adapterMainV1W"        ? 100 :
name=="adapterMainV1H"        ? gvvR("batteryBaseH") + 10 :
name=="adapterMainV1D"        ? 22 :
name=="adapterMainV1X"        ? gvv("ryobiBatteryShiftV1X") :
name=="adapterMainV1Y"        ? 0 :
name=="adapterMainV1Z"        ? 5 :
name=="adapterMainV1Radius"       ? 5 :
name=="adapterMainV1RotX"     ? 0 :
name=="adapterMainV1RotY"     ? 0 :
name=="adapterMainV1RotZ"     ? 0 :
//////adapterMainFrontExtension dimensions'
name=="adapterMainFrontExtensionV1W"      ?110 :
name=="adapterMainFrontExtensionV1H"      ? gvvD("handleH")+6 :
name=="adapterMainFrontExtensionV1D"      ? gvv("adapterMainV1D") :
name=="adapterMainFrontExtensionV1X"      ? -50 :
name=="adapterMainFrontExtensionV1Y"      ? 0 :
name=="adapterMainFrontExtensionV1Z"      ? gvv("adapterMainV1Z") :
name=="adapterMainFrontExtensionV1Radius"     ? 5 :
name=="adapterMainFrontExtensionV1RotX"       ? 0 :
name=="adapterMainFrontExtensionV1RotY"       ? 0 :
name=="adapterMainFrontExtensionV1RotZ"       ? 0 :
//////adapterMain dimensions'    
name=="adapterMainV2W"        ? 115 :
name=="adapterMainV2H"        ? gvvR("batteryBaseH") + 15 :
name=="adapterMainV2D"        ? 22 :
name=="adapterMainV2X"        ? gvv("ryobiBatteryShiftV2X")+3 :
name=="adapterMainV2Y"        ? -28 :
name=="adapterMainV2Z"        ? 5 :
name=="adapterMainV2Radius"       ? 5 :
name=="adapterMainV2RotX"     ? 0 :
name=="adapterMainV2RotY"     ? 0 :
name=="adapterMainV2RotZ"     ? 0 :
//////adapterMainFrontExtension dimensions'
name=="adapterMainFrontExtensionV2W"      ? 0 :
name=="adapterMainFrontExtensionV2H"      ? 0 :
name=="adapterMainFrontExtensionV2D"      ? 0 :
name=="adapterMainFrontExtensionV2X"      ? -50 :
name=="adapterMainFrontExtensionV2Y"      ? 0 :
name=="adapterMainFrontExtensionV2Z"      ? gvv("adapterMainV2Z") :
name=="adapterMainFrontExtensionV2Radius"     ? 5 :
name=="adapterMainFrontExtensionV2RotX"       ? 0 :
name=="adapterMainFrontExtensionV2RotY"       ? 0 :
name=="adapterMainFrontExtensionV2RotZ"       ? 0 :
//////adapterMainBatteryStemMask dimensions'
name=="adapterMainBatteryStemMaskW"     ? 60 :
name=="adapterMainBatteryStemMaskH"     ? 33 :
name=="adapterMainBatteryStemMaskD"     ? 100 :
name=="adapterMainBatteryStemMaskX"     ? -20 :
name=="adapterMainBatteryStemMaskY"     ? 0 :
name=="adapterMainBatteryStemMaskZ"     ? gvv("adapterMainBatteryStemMaskD") :
name=="adapterMainBatteryStemMaskRadius"        ? 0 :
name=="adapterMainBatteryStemMaskRotX"      ? 0 :
name=="adapterMainBatteryStemMaskRotY"      ? 0 :
name=="adapterMainBatteryStemMaskRotZ"      ? 0 : 
//////testWireHole dimensions'
//////testWireHole coordinates'
name=="testWireHoleFrontW"       ? 0 :
name=="testWireHoleFrontH"       ? 0 :
name=="testWireHoleFrontD"       ? 62 :
name=="testWireHoleFrontX"       ? 20 :
name=="testWireHoleFrontY"       ? -35 :
name=="testWireHoleFrontZ"       ? 10 :
name=="testWireHoleFrontRadius"      ? 4 :
name=="testWireHoleFrontRotX"        ? 70 :
name=="testWireHoleFrontRotY"        ? 0 :
name=="testWireHoleFrontRotZ"        ? 60 :
//////testWireHoleRear dimensions'
name=="testWireHoleRearW"       ? gvv("testWireHoleFrontW") :
name=="testWireHoleRearH"       ? gvv("testWireHoleFrontH") :
name=="testWireHoleRearD"       ? gvv("testWireHoleFrontD") :
name=="testWireHoleRearX"       ? gvv("testWireHoleFrontX") :
name=="testWireHoleRearY"       ? -gvv("testWireHoleFrontY") :
name=="testWireHoleRearZ"       ? gvv("testWireHoleFrontZ") :
name=="testWireHoleRearRadius"      ? gvv("testWireHoleFrontRadius") :
name=="testWireHoleRearRotX"        ? -gvv("testWireHoleFrontRotX") :
name=="testWireHoleRearRotY"        ? gvv("testWireHoleFrontRotY") :
name=="testWireHoleRearRotZ"        ? -gvv("testWireHoleFrontRotZ") :
//////testWireHole coordinates'
name=="testWireHoleV2W"       ? 0 :
name=="testWireHoleV2H"       ? 0 :
name=="testWireHoleV2D"       ? 70 :
name=="testWireHoleV2X"       ? -26 :
name=="testWireHoleV2Y"       ? -70 :
name=="testWireHoleV2Z"       ? 7 :
name=="testWireHoleV2Radius"      ? 5 :
name=="testWireHoleV2RotX"        ? 76 :
name=="testWireHoleV2RotY"        ? 0 :
name=="testWireHoleV2RotZ"        ? 0 :

////////////////////////////////////
////////////      DeWalt Stuff
//////dewaltMainV1 dimensions'
name=="dewaltMainV1W"       ? 110 :
name=="dewaltMainV1H"       ? 90 :
name=="dewaltMainV1D"       ? 20 :
name=="dewaltMainV1X"       ? -45 :
name=="dewaltMainV1Y"       ? 0 :
name=="dewaltMainV1Z"       ? 3 :
name=="dewaltMainV1Radius"      ? 0 :
name=="dewaltMainV1RotX"        ? 0 :
name=="dewaltMainV1RotY"        ? 0 :
name=="dewaltMainV1RotZ"        ? 0 :
//////dewaltMainHoleA dimensions'
name=="dewaltMainHoleAW"        ? 0 :
name=="dewaltMainHoleAH"        ? 0 :
name=="dewaltMainHoleAD"        ? 0 :
name=="dewaltMainHoleAX"        ? gvv("dewaltMainV1W") / 2 + gvv("dewaltMainV1X")-6 :
name=="dewaltMainHoleAY"        ? gvv("dewaltMainV1H") / 2 + gvv("dewaltMainV1Y")-6 : 
name=="dewaltMainHoleAZ"        ? 0 :
name=="dewaltMainHoleARadius"       ? 0 :
name=="dewaltMainHoleARotX"     ? 0 :
name=="dewaltMainHoleARotY"     ? 0 :
name=="dewaltMainHoleARotZ"     ? 0 :
//////dewaltMainB dimensions'
name=="dewaltMainHoleBD"        ? gvv("dewaltMainHoleAD") :
name=="dewaltMainHoleBX"        ? -gvv("dewaltMainV1W") / 2 + gvv("dewaltMainV1X")+6 :
name=="dewaltMainHoleBY"        ? gvv("dewaltMainV1H") / 2 + gvv("dewaltMainV1Y")-6 :
name=="dewaltMainHoleBZ"        ? gvv("dewaltMainHoleAZ") :
//////dewaltMainC dimensions'
name=="dewaltMainHoleCD"        ? gvv("dewaltMainHoleAD") :
name=="dewaltMainHoleCX"        ? gvv("dewaltMainV1W") / 2 + gvv("dewaltMainV1X")-6 :
name=="dewaltMainHoleCY"        ? -gvv("dewaltMainV1H") / 2 + gvv("dewaltMainV1Y")+6 :
name=="dewaltMainHoleCZ"        ? gvv("dewaltMainHoleAZ") :
//////dewaltMainB dimensions'
name=="dewaltMainHoleDD"        ? gvv("dewaltMainHoleAD") :
name=="dewaltMainHoleDX"        ? -gvv("dewaltMainV1W") / 2 + gvv("dewaltMainV1X")+6 :
name=="dewaltMainHoleDY"        ? -gvv("dewaltMainV1H") / 2 + gvv("dewaltMainV1Y")+6 :
name=="dewaltMainHoleDZ"        ? gvv("dewaltMainHoleAZ") :
//////dewaltBatteryHolder dimensions'
name=="dewaltBatteryHolderW"        ? 0 :
name=="dewaltBatteryHolderH"        ? 0 :
name=="dewaltBatteryHolderD"        ? 0 :
name=="dewaltBatteryHolderX"        ? -34:
name=="dewaltBatteryHolderY"        ? 0 :
name=="dewaltBatteryHolderZ"        ? -10 :
name=="dewaltBatteryHolderRadius"       ? 0 :
name=="dewaltBatteryHolderRotX"     ? 0 :
name=="dewaltBatteryHolderRotY"     ? 0 :
name=="dewaltBatteryHolderRotZ"     ? 0 :
//////dewaltBatteryHolderMain dimensions'
name=="dewaltBatteryHolderMainW"        ? 88 :
name=="dewaltBatteryHolderMainH"        ? 59 :
name=="dewaltBatteryHolderMainD"        ? 22 :
name=="dewaltBatteryHolderMainX"        ? 0 :
name=="dewaltBatteryHolderMainY"        ? 0 :
name=="dewaltBatteryHolderMainZ"        ? 0 :
name=="dewaltBatteryHolderMainRadius"       ? 0 :
name=="dewaltBatteryHolderMainRotX"     ? 0 :
name=="dewaltBatteryHolderMainRotY"     ? 0 :
name=="dewaltBatteryHolderMainRotZ"     ? 0 :
//////dewaltBatteryHolderHoleA dimensions'
name=="dewaltBatteryHolderHoleAW"       ? 0 :
name=="dewaltBatteryHolderHoleAH"       ? 0 :
name=="dewaltBatteryHolderHoleAD"       ? 0 :
name=="dewaltBatteryHolderHoleAX"       ? 13.25 :
name=="dewaltBatteryHolderHoleAY"       ? 0 :
name=="dewaltBatteryHolderHoleAZ"       ? 6 :
name=="dewaltBatteryHolderHoleARadius"      ? 0 :
name=="dewaltBatteryHolderHoleARotX"        ? 0 :
name=="dewaltBatteryHolderHoleARotY"        ? 0 :
name=="dewaltBatteryHolderHoleARotZ"        ? 0 :
//////dewaltBatteryHolderHoleB dimensions'
name=="dewaltBatteryHolderHoleBW"       ? 0 :
name=="dewaltBatteryHolderHoleBH"       ? 0 :
name=="dewaltBatteryHolderHoleBD"       ? 0 :
name=="dewaltBatteryHolderHoleBX"       ? -gvv("dewaltBatteryHolderHoleAX") :
name=="dewaltBatteryHolderHoleBY"       ? 0 :
name=="dewaltBatteryHolderHoleBZ"       ? gvv("dewaltBatteryHolderHoleAZ") :
name=="dewaltBatteryHolderHoleBRadius"      ? 0 :
name=="dewaltBatteryHolderHoleBRotX"        ? 0 :
name=="dewaltBatteryHolderHoleBRotY"        ? 0 :
name=="dewaltBatteryHolderHoleBRotZ"        ? 0 :
//////dewaltBatteryHolderWireClearance dimensions'
name=="dewaltBatteryHolderWireClearanceW"       ? 25 :
name=="dewaltBatteryHolderWireClearanceH"       ? 25 :
name=="dewaltBatteryHolderWireClearanceD"       ? gvv("dewaltBatteryHolderMainD") + 10 :
name=="dewaltBatteryHolderWireClearanceX"       ? -(gvv("dewaltBatteryHolderMainW") + gvv("dewaltBatteryHolderWireClearanceW"))/2 :
name=="dewaltBatteryHolderWireClearanceY"       ? 0 :
name=="dewaltBatteryHolderWireClearanceZ"       ? gvv("dewaltBatteryHolderMainZ") + 10:
name=="dewaltBatteryHolderWireClearanceRadius"      ? 0 :
name=="dewaltBatteryHolderWireClearanceRotX"        ? 0 :
name=="dewaltBatteryHolderWireClearanceRotY"        ? 0 :
name=="dewaltBatteryHolderWireClearanceRotZ"        ? 0 :
////////////////////////////////////
////////////      Dyson Stuff
//////dysonChargeBoard dimensions'
name=="dysonChargeBoardW"       ? 0 :
name=="dysonChargeBoardH"       ? 0 :
name=="dysonChargeBoardD"       ? 0 :
name=="dysonChargeBoardX"       ? -37 :
name=="dysonChargeBoardY"       ? 0 :
name=="dysonChargeBoardZ"       ? 3 :
name=="dysonChargeBoardRadius"      ? 0 :
name=="dysonChargeBoardRotX"        ? 0 :
name=="dysonChargeBoardRotY"        ? 0 :
name=="dysonChargeBoardRotZ"        ? 0 :
//////dysonChargeBoardSquare dimensions'
name=="dysonChargeBoardSquareW"     ? 84 :
name=="dysonChargeBoardSquareH"     ? 28 :
name=="dysonChargeBoardSquareD"     ? 3 :
name=="dysonChargeBoardSquareX"     ? 0 :
name=="dysonChargeBoardSquareY"     ? 0 :
name=="dysonChargeBoardSquareZ"     ? 0 :
name=="dysonChargeBoardSquareRadius"        ? 0 :
name=="dysonChargeBoardSquareRotX"      ? 0 :
name=="dysonChargeBoardSquareRotY"      ? 0 :
name=="dysonChargeBoardSquareRotZ"      ? 0 :
//////dysonChargeBoardClearanceA dimensions'
name=="dysonChargeBoardClearanceAW"     ? gvv("dysonChargeBoardSquareW") :
name=="dysonChargeBoardClearanceAH"     ? gvv("dysonChargeBoardSquareH") / 2 -5 :
name=="dysonChargeBoardClearanceAD"     ? 10 :
name=="dysonChargeBoardClearanceAX"     ? 0 :
name=="dysonChargeBoardClearanceAY"     ? -gvv("dysonChargeBoardSquareH") / 2 + gvv("dysonChargeBoardClearanceAH") / 2   :
name=="dysonChargeBoardClearanceAZ"     ? -gvv("dysonChargeBoardSquareD") :
name=="dysonChargeBoardClearanceARadius"        ? 0 :
name=="dysonChargeBoardClearanceARotX"      ? 0 :
name=="dysonChargeBoardClearanceARotY"      ? 0 :
name=="dysonChargeBoardClearanceARotZ"      ? 0 :
//////dysonChargeBoardClearanceB dimensions'
name=="dysonChargeBoardClearanceBW"     ? 10 :
name=="dysonChargeBoardClearanceBH"     ? gvv("dysonChargeBoardSquareH") :
name=="dysonChargeBoardClearanceBD"     ? gvv("dysonChargeBoardClearanceAD") :
name=="dysonChargeBoardClearanceBX"     ? (gvv("dysonChargeBoardSquareW") - gvv("dysonChargeBoardClearanceBW")) /2 :
name=="dysonChargeBoardClearanceBY"     ? 0 :
name=="dysonChargeBoardClearanceBZ"     ? -gvv("dysonChargeBoardSquareD") :
name=="dysonChargeBoardClearanceBRadius"        ? 0 :
name=="dysonChargeBoardClearanceBRotX"      ? 0 :
name=="dysonChargeBoardClearanceBRotY"      ? 0 :
name=="dysonChargeBoardClearanceBRotZ"      ? 0 :
//////dysonChargeBoardHole dimensions'
name=="dysonChargeBoardHoleW"       ? gvv("dysonChargeBoardSquareW") :
name=="dysonChargeBoardHoleH"       ? gvv("dysonChargeBoardSquareH") :
name=="dysonChargeBoardHoleD"       ? 0 :
name=="dysonChargeBoardHoleX"       ? 27 :
name=="dysonChargeBoardHoleY"       ? gvv("dysonChargeBoardSquareY") :
name=="dysonChargeBoardHoleZ"       ? -10.5 :
name=="dysonChargeBoardHoleRadius"      ? gvv("dysonChargeBoardSquareRadius") :
name=="dysonChargeBoardHoleRotX"        ? gvv("dysonChargeBoardSquareRotX") :
name=="dysonChargeBoardHoleRotY"        ? gvv("dysonChargeBoardSquareRotY") :
name=="dysonChargeBoardHoleRotZ"        ? gvv("dysonChargeBoardSquareRotZ") :
//////dysonCarcass dimensions'
name=="dysonCarcassW"      ? 0 :
name=="dysonCarcassH"      ? 0 :
name=="dysonCarcassD"      ? 0 :
name=="dysonCarcassX"      ? -50:
name=="dysonCarcassY"      ? 0 :
name=="dysonCarcassZ"      ? 0 :
name=="dysonCarcassRadius"     ? 0 :
name=="dysonCarcassRotX"       ? 0 :
name=="dysonCarcassRotY"       ? 0 :
name=="dysonCarcassRotZ"       ? 0 :
//////dysonCarcassTop dimensions'
name=="dysonCarcassTopW"       ? 110 :
name=="dysonCarcassTopH"       ? 45 :
name=="dysonCarcassTopD"       ? 100 :
name=="dysonCarcassTopX"       ? 0 :
name=="dysonCarcassTopY"       ? 0 :
name=="dysonCarcassTopZ"       ? gvv("dysonCarcassTopD") :
name=="dysonCarcassTopRadius"      ? 0 :
name=="dysonCarcassTopRotX"        ? 0 :
name=="dysonCarcassTopRotY"        ? 0 :
name=="dysonCarcassTopRotZ"        ? 0 :
//////dysonCarcassBottom dimensions'    
name=="dysonCarcassBottomW"        ? 110 :
name=="dysonCarcassBottomH"        ? 68 :
name=="dysonCarcassBottomD"        ? 4 :
name=="dysonCarcassBottomX"        ? 0 :
name=="dysonCarcassBottomY"        ? 0 :
name=="dysonCarcassBottomZ"        ? 0 :
name=="dysonCarcassBottomRadius"       ? 0 :
name=="dysonCarcassBottomRotX"     ? 0 :
name=="dysonCarcassBottomRotY"     ? 0 :
name=="dysonCarcassBottomRotZ"     ? 0 :

0;