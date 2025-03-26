v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 0 -800 800 -400 {flags=graph
y1=-28
y2=19
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=-0.0011
x2=0.0009
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0

color="4 6"
node="nwell_net

isosub_net"}
N -510 -210 -510 -190 {
lab=GND}
N -350 -210 -350 -190 {
lab=GND}
N -510 -350 -510 -270 {
lab=isosub_net}
N -510 -350 -350 -350 {
lab=isosub_net}
N -350 -350 -350 -330 {
lab=isosub_net}
N -350 -270 -270 -270 {
lab=nwell_net}
N -350 -350 -270 -350 {
lab=isosub_net}
N -270 -270 -270 -250 {
lab=nwell_net}
C {devices/gnd.sym} -510 -190 0 0 {name=l2 lab=GND}
C {devices/code_shown.sym} -560 -730 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.include diodes.lib
"}
C {devices/code_shown.sym} -560 -580 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 

dc I0 -1m 1m 1u
write dc_isolbox.raw
wrdata isolbox.csv nwell_net isosub_net
.endc
"}
C {devices/title.sym} -360 130 0 0 {name=l5 author="Copyright 2023 IHP PDK Authors"}
C {devices/launcher.sym} 70 -360 0 0 {name=h5
descr="Load IV curve" 
tclcommand="xschem raw_read $netlist_dir/dc_isolbox.raw dc"
}
C {isource.sym} -510 -240 2 0 {name=I0 value=1m}
C {devices/gnd.sym} -350 -190 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -270 -350 2 0 {name=p1 sig_type=std_logic lab=isosub_net}
C {lab_pin.sym} -270 -270 2 0 {name=p2 sig_type=std_logic lab=nwell_net}
C {capa.sym} -270 -220 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} -270 -190 0 0 {name=l3 lab=GND}
C {sg13g2_pr/isolbox.sym} -350 -270 0 0 {name=D1
model=isolbox
l=3.0u
w=3.0u
spiceprefix=X
}
