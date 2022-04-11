


include <OPSC-base.scad>
include <DYSON-library.scad>
include <RYOBI-library.scad>



OPSCbuild(shift=200);

// ZZZZ
// Description
module draw1(){    
    color="yellow";
    drawAdapterV1(color);
}

module drawAdapterV1(color){
    testing = false;
    difference(){
        //postive portion
        
        union(){            
//////adapterMain oi
            oii("cubeRounded","adapterMain",color);            
//////adapterMainFrontExtension oi
            oii("cubeRounded","adapterMainFrontExtension",color);
        }
        //negative portion
        union(){            
//////testWireHole oi
//////testWireHoleFront oii insert    
            oii("cylinder","testWireHoleFront",color);  
            oii("cylinder","testWireHoleRear",color);            
            


            oiiiDyson("dysonHandleClearance","dysonShift",color);     ////
            oiiiDyson("dysonV6Handle","dysonShift",color);     ////
            oiiiDyson("dysonV6DustBin","dysonShift",color);     ////
            //oiiiDyson("dysonV6Battery","dysonShift",color);     ////
            oiiiDyson("dysonV6FrontScrewNegative","dysonShift",color);     ////
            oiiiDyson("dysonV6batteryTerminals","dysonShift",color);     ////
            oiiiRyobi("ryobiBattery","ryobiBatteryShift",color);     ////
        }
    }
    //////adding things back
    #oiiiRyobi("ryobiBatteryClips","ryobiBatteryShift",color);     
    intersection(){
//////adapterainBatteryStemMask oi
            oii("cube","adapterMainBatteryStemMask",color);
            oiiiDyson("dysonV6Battery","dysonShift",color);     /////
    }


    if(testing){
        color = "blue";
    //////ryobiBatteryShift oiii insert            
        oiiiRyobi("ryobiBattery","ryobiBatteryShift",color);     ////ASSEMBLY
    //////dysonShift oiii insert    
        oiiiDyson("dysonV6Handle","dysonShift",color);     ////ASSEMBLY
        oiiiDyson("dysonV6DustBin","dysonShift",color);     ////ASSEMBLY
    }
}

// ZZZZ
// Description
module draw2(){
    color="orange";
    
}

// ZZZZ
// Description
module draw3(){
    color="yellow";
    
}

// ZZZZ
// Description
module draw4(){
    color="green";
    
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

module oiiiRyobi(type,name,color){
   oiiR(type,x=gvv(str(name,"X")),y=gvv(str(name,"Y")),z=gvv(str(name,"Z")),rotX=gvv(str(name,"RotX")),rotY=gvv(str(name,"RotY")),rotZ=gvv(str(name,"RotZ")),color=color); 
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
    name=="ryobiBatteryShiftX"      ? 22 :
    name=="ryobiBatteryShiftY"      ? 0 :    
    name=="ryobiBatteryShiftZ"      ? 36 :    
    name=="ryobiBatteryShiftRotX"       ? 0 :    
    name=="ryobiBatteryShiftRotY"       ? 0 :    
    name=="ryobiBatteryShiftRotZ"       ? 0 :    
//////dysonShift coordinates'o    
    name=="dysonShiftX"     ? 0 :
    name=="dysonShiftY"     ? 0 :    
    name=="dysonShiftZ"     ? 0 :    
    name=="dysonShiftRotX"      ? 0 :    
    name=="dysonShiftRotY"      ? 0 :    
    name=="dysonShiftRotZ"      ? 0 :  
//////adapterMain dimensions'    
name=="adapterMainW"        ? 100 :
name=="adapterMainH"        ? gvvR("batteryBaseH") + 10 :
name=="adapterMainD"        ? 22 :
name=="adapterMainX"        ? gvv("ryobiBatteryShiftX") :
name=="adapterMainY"        ? 0 :
name=="adapterMainZ"        ? 5 :
name=="adapterMainRadius"       ? 5 :
name=="adapterMainRotX"     ? 0 :
name=="adapterMainRotY"     ? 0 :
name=="adapterMainRotZ"     ? 0 :
//////adapterMainFrontExtension dimensions'
name=="adapterMainFrontExtensionW"      ?110 :
name=="adapterMainFrontExtensionH"      ? gvvD("handleH")+6 :
name=="adapterMainFrontExtensionD"      ? gvv("adapterMainD") :
name=="adapterMainFrontExtensionX"      ? -50 :
name=="adapterMainFrontExtensionY"      ? 0 :
name=="adapterMainFrontExtensionZ"      ? gvv("adapterMainZ") :
name=="adapterMainFrontExtensionRadius"     ? 5 :
name=="adapterMainFrontExtensionRotX"       ? 0 :
name=="adapterMainFrontExtensionRotY"       ? 0 :
name=="adapterMainFrontExtensionRotZ"       ? 0 :
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
//////testWireHole dimensions'//////testWireHole coordinates'
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

0;