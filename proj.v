module proj();

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

module fire_exit(y,a,b);
    input a,b;
    output y;
    wire w0,w1;
    sensor sensor0(w0,w1,a,b);
    or or0(y,w0,w1);
endmodule

module fire_dept_alert(y,a,b);
    input a,b;
    output y;
    wire w0,w1;
    sensor sensor0(w0,w1,a,b);
    or or0(y,w0,w1);
endmodule

module fire_alarm(y,a,b);
    input a,b;
    output y;
    wire w0,w1;
    sensor sensor0(w0,w1,a,b);
    or or0(y,w0,w1);
endmodule

module server_signal(y,a,b);
    input a,b;
    output y;
    wire w0,w1;
    sensor sensor0(w0,w1,a,b);
    or or0(y,w0,w1);
endmodule

// Security Alerting System
module security_warning(s0,s1,s2,s3,a,b);
    input a,b;
    output s0,s1,s2,s3;
    wire w0,w1;
    sensor sensor0(w0,w1,a,b);
    or or0(s0,w0,w1), or1(s1,w0,w1), or2(s2,w0,w1), or3(s3,w0,w1);
endmodule

module demux(s0,s1,s2,s3,a);
    input wire logic [2:0] a;
    output s0,s1,s2,s3;
    wire w0,w1;
    and and0(s0,w1,a[2],w0), and1(s1,a[1],a[2],w0), and2(s2,w1,a[2],a[0]), and3(s3,a[1],a[2],a[0]);
    not not0(w0,a[0]), not1(w1,a[1]);
endmodule

module security(y,m0,m1,m2,m3,c0,c1,c2,c3,f0,q0);
    input m0, m1, m2, m3, c0, c1, c2, c3, f0, q0;
    output y;
    or or0(y, m0, m1, m2, m3, c0, c1, c2, c3);
endmodule

module security_signal_distributor(s0,s1,s2,s3,m0,m1,m2,m3,c0,c1,c2,c3);
    input m0[2:0], m1[2:0], m2[2:0], m3[2:0], c0[2:0], c1[2:0], c2[2:0], c3[2:0];
    output s0, s1, s2, s3;
    wire d0s0, d0s1, d0s2, d0s3, d1s0, d1s1, d1s2, d1s3, d2s0, d2s1, d2s2, d2s3, d3s0, d3s1, d3s2, d3s3,
    d4s0, d4s1, d4s2, d4s3, d5s0, d5s1, d5s2, d5s3, d6s0, d6s1, d6s2, d6s3, d7s0, d7s1, d7s2, d7s3;
    demux d0(d0s0, d0s1, d0s2, d0s3, m0), d1(d1s0, d1s1, d1s2, d1s3, m1), d2(d2s0, d2s1, d2s2, d2s3, m2), d3(d3s0, d3s1, d3s2, d3s3, m3),
    d4(d4s0, d4s1, d4s2, d4s3, c0), d5(d5s0, d5s1, d5s2, d5s3, c1), d6(d6s0, d6s1, d6s2, d6s3, c2), d7(d7s0, d7s1, d7s2, d7s3, c3);
    security sec0(s0, d0s0, d1s0, d2s0, d3s0, d4s0, d5s0, d6s0, d7s0), sec1(s1, d0s1, d1s1, d2s1, d3s1, d4s1, d5s1, d6s1, d7s1),
    sec2(s2, d0s2, d1s2, d2s2, d3s2, d4s2, d5s2, d6s2, d7s2), sec3(s3, d0s3, d1s3, d2s3, d3s3, d4s3, d5s3, d6s3, d7s3);
endmodule

// Employee Access System
module decimal_to_bcd(input wire [3:0] dec, output reg [3:0] bcd);
endmodule

module dff (input wire [7:0] dec, output a);
  wire s0,s1,s2,s3,s4,s5,s6,s7;
  reg [7:0] temp=8'd31;
  xnor x0(s0,dec[0],temp[0]), x1(s1,dec[1],temp[1]), x2(s2,dec[2],temp[2]), x3(s3,dec[3],temp[3]), x4(s4,dec[4],temp[4]), x5(s5,dec[5],temp[5]), x6(s6,dec[6],temp[6]), x7(s7,dec[7],temp[7]);
  and a1(a,s0,s1,s2,s3,s4,s5,s6,s7);
endmodule

// Testbench
module test;
  reg [7:0] dec;
  wire a;
  dff p1(dec,a);
initial 
  begin;
    $monitor("dec=%d, a=%b\n",dec,a);
	dec=20;
    #10;
    dec=31;
    #10;
    dec=29;
    #10;
    dec=13;
    #10;
    dec=43;
    #10;
    dec=91;
    #10;
  end
endmodule
