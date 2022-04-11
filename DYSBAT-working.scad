


include <OPSC-base.scad>




OPSCbuild(shift=200);

// ZZZZ
// Description
module draw1(){
    color="red";
    
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

module oii(type,name,color="gray",x=0,y=0,z=0,ex=0,length=0,rotX=0,rotY=0,rotZ=0,width=0,height=0,depth=100,rad=0,rad2=0,alpha=1,OOwidth=0,OOheight=0,holes=true,negative=true){
    color(color,alpha){
        translate([x,y,z]){
                rotate([rotX,rotY,rotZ]){
                    if(type=="TEST"){
                        t = 0;
                    }else if(type=="TEST2"){
                        t = 0;
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
0;