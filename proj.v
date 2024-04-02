/*

*/
module proj(fire, earth_quake,
    mds0, mds1, mds2, mds3,
    cam0, cam1, cam2, cam3, 
    access_code,
    sec0, sec1, sec2, sec3,
    door, fire_exit, fire_dept_alert, fire_alarm, server_backup_signal
    );

    input fire, earth_quake;
    input mds0[2:0], mds1[2:0], mds2[2:0], mds3[2:0], cam0[2:0], cam1[2:0], cam2[2:0], cam3[2:0];
    input [11:0] access_code;

    output sec0, sec1, sec2, sec3;
    output door, fire_exit, fire_dept_alert, fire_alarm, server_backup_signal;

    fire_exit_m fire_exit0(fire_exit, fire, earth_quake);
    fire_dept_alert_m fire_dept_alert0(fire_dept_alert, fire, earth_quake);
    fire_alarm_m fire_alarm0(fire_alarm, fire, earth_quake);
    server_backup_signal_m server_backup_signal0(server_backup_signal, fire, earth_quake);

    security_signal_distributor_m security_signal_distributor0(sec0, sec1, sec2, sec3,mds0, mds1, mds2, mds3, cam0, cam1, cam2, cam3);

    employee_access_m employee_access0(access_code, door);
endmodule

// Calamity/Disaster Management
module fire_sensor(y,a);
    input fire;
    output y;
    and and0(y,1'b1,a);
endmodule

module earth_quake_sensor(y,a);
    input a;
    output y;
    and and0(y,1'b1,a);
endmodule

module sensor(x,y,a,b);
    input a,b;
    output x,y;
    fire_sensor fire0(x,a);
    earth_quake_sensor quake0(y,b);
endmodule

module fire_exit_m(y,a,b);
    input a,b;
    output y;
    wire w0,w1;
    sensor sensor0(w0,w1,a,b);
    or or0(y,w0,w1);
endmodule

module fire_dept_alert_m(y,a,b);
    input a,b;
    output y;
    wire w0,w1;
    sensor sensor0(w0,w1,a,b);
    or or0(y,w0,w1);
endmodule

module fire_alarm_m(y,a,b);
    input a,b;
    output y;
    wire w0,w1;
    sensor sensor0(w0,w1,a,b);
    or or0(y,w0,w1);
endmodule

module server_backup_signal_m(y,a,b);
    input a,b;
    output y;
    wire w0,w1;
    sensor sensor0(w0,w1,a,b);
    or or0(y,w0,w1);
endmodule

// Security Alerting System
module demux_m(s0,s1,s2,s3,a);
    input wire logic [2:0] a;
    output s0,s1,s2,s3;
    wire w0,w1;
    and and0(s0,w1,a[2],w0), and1(s1,a[1],a[2],w0), and2(s2,w1,a[2],a[0]), and3(s3,a[1],a[2],a[0]);
    not not0(w0,a[0]), not1(w1,a[1]);
endmodule

module security_signal_distributor_m(s0,s1,s2,s3,m0,m1,m2,m3,c0,c1,c2,c3);
    input m0[2:0], m1[2:0], m2[2:0], m3[2:0], c0[2:0], c1[2:0], c2[2:0], c3[2:0];
    output s0, s1, s2, s3;

    wire d0s0, d0s1, d0s2, d0s3, d1s0, d1s1, d1s2, d1s3, d2s0, d2s1, d2s2, d2s3, d3s0, d3s1, d3s2, d3s3,
    d4s0, d4s1, d4s2, d4s3, d5s0, d5s1, d5s2, d5s3, d6s0, d6s1, d6s2, d6s3, d7s0, d7s1, d7s2, d7s3;

    demux d0(d0s0, d0s1, d0s2, d0s3, m0), d1(d1s0, d1s1, d1s2, d1s3, m1), d2(d2s0, d2s1, d2s2, d2s3, m2), d3(d3s0, d3s1, d3s2, d3s3, m3),
    d4(d4s0, d4s1, d4s2, d4s3, c0), d5(d5s0, d5s1, d5s2, d5s3, c1), d6(d6s0, d6s1, d6s2, d6s3, c2), d7(d7s0, d7s1, d7s2, d7s3, c3);

    security sec0(s0, d0s0, d1s0, d2s0, d3s0, d4s0, d5s0, d6s0, d7s0), sec1(s1, d0s1, d1s1, d2s1, d3s1, d4s1, d5s1, d6s1, d7s1),
    sec2(s2, d0s2, d1s2, d2s2, d3s2, d4s2, d5s2, d6s2, d7s2), sec3(s3, d0s3, d1s3, d2s3, d3s3, d4s3, d5s3, d6s3, d7s3);
endmodule

module security_m(y,m0,m1,m2,m3,c0,c1,c2,c3);
    input m0, m1, m2, m3, c0, c1, c2, c3;
    output y;
    or or0(y, m0, m1, m2, m3, c0, c1, c2, c3);
endmodule

// Employee Access System
module employee_access_m(input wire [11:0] dec, output a);
    wire s00,s01,s02,s03,s04,s05,s06,s07,s08,s09,s010,s011, 
    s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s110,s111,
    s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s210,s211,
    s30,s31,s32,s33,s34,s35,s36,s37,s38,s39,s310,s311,
    a0,a1,a2,a3;

    reg [11:0] temp0=12'd731;
    reg [11:0] temp1=12'd294;
    reg [11:0] temp2=12'd337;
    reg [11:0] temp3=12'd191;

    xnor xnor00(s00,dec[0],temp0[0]), xnor01(s01,dec[1],temp0[1]), xnor02(s02,dec[2],temp0[2]), xnor03(s03,dec[3],temp0[3]), 
    xnor04(s04,dec[4],temp0[4]), xnor05(s05,dec[5],temp0[5]), xnor06(s06,dec[6],temp0[6]), xnor07(s07,dec[7],temp0[7]),
    xnor08(s08,dec[8],temp0[8]), xnor09(s09,dec[9],temp0[9]), xnor010(s010,dec[10],temp0[10]), xnor011(s011,dec[11],temp0[11]);

    xnor xnor10(s10,dec[0],temp1[0]), xnor11(s11,dec[1],temp1[1]), xnor12(s12,dec[2],temp1[2]), xnor13(s13,dec[3],temp1[3]), 
    xnor14(s14,dec[4],temp1[4]), xnor15(s15,dec[5],temp1[5]), xnor16(s16,dec[6],temp1[6]), xnor17(s17,dec[7],temp1[7]),
    xnor18(s18,dec[8],temp1[8]), xnor19(s19,dec[9],temp1[9]), xnor110(s110,dec[10],temp1[10]), xnor111(s111,dec[11],temp1[11]);

    xnor xnor20(s20,dec[0],temp2[0]), xnor21(s21,dec[1],temp2[1]), xnor22(s22,dec[2],temp2[2]), xnor23(s23,dec[3],temp2[3]), 
    xnor24(s24,dec[4],temp2[4]), xnor25(s25,dec[5],temp2[5]), xnor26(s26,dec[6],temp2[6]), xnor27(s27,dec[7],temp2[7]),
    xnor28(s28,dec[8],temp2[8]), xnor29(s29,dec[9],temp2[9]), xnor210(s210,dec[10],temp2[10]), xnor211(s211,dec[11],temp2[11]);

    xnor xnor30(s30,dec[0],temp3[0]), xnor31(s31,dec[1],temp3[1]), xnor32(s32,dec[2],temp3[2]), xnor33(s33,dec[3],temp3[3]), 
    xnor34(s34,dec[4],temp3[4]), xnor35(s35,dec[5],temp3[5]), xnor36(s36,dec[6],temp3[6]), xnor37(s37,dec[7],temp3[7]),
    xnor38(s38,dec[8],temp3[8]), xnor39(s39,dec[9],temp3[9]), xnor310(s310,dec[10],temp3[10]), xnor311(s311,dec[11],temp3[11]);

    and and0(a0,s00,s01,s02,s03,s04,s05,s06,s07,s08,s09,s010,s011), and1(a1,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s110,s111), 
    and2(a2,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s210,s211), and3(a3,s30,s31,s32,s33,s34,s35,s36,s37,s38,s39,s310,s311);

    or or0(a,a0,a1,a2,a3);
endmodule
