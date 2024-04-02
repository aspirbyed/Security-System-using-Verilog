module proj_tb;
reg fire, earth_quake, mds0[2:0], mds1[2:0], mds2[2:0], mds3[2:0], cam0[2:0], cam1[2:0], cam2[2:0], cam3[2:0], access_code[11:0];
wire sec0, sec1, sec2, sec3, door, fire_exit, fire_dept_alert, fire_alarm, server_backup_signal;

proj proj0(fire, earth_quake,
    mds0, mds1, mds2, mds3,
    cam0, cam1, cam2, cam3, 
    access_code,
    sec0, sec1, sec2, sec3,
    door, fire_exit, fire_dept_alert, fire_alarm, server_backup_signal
);

initial begin
    $monitor("Input:\n
    fire=%b, earth_quake=%b, \n
    mds0=%b, mds1=%b, mds2=%b, mds3=%b, \n
    cam0=%b, cam1=%b, cam2=%b, cam3=%b, \n
    access_code=%b, \n
    Output:\n
    sec0=%b, sec1=%b, sec2=%b, sec3=%b, \n
    door=%b, fire_exit=%b, fire_dept_alert=%b, fire_alarm=%b, server_backup_signal=%b \n",);
    fire=0; earth_quake=0;
    mds0=000; mds1=001; mds2=010; mds3=011;
    cam0=000; cam1=001; cam2=010; cam3=011;
    access_code=123;
    #10;

    //Camera
    // Sec0
    fire=0; earth_quake=0;
    mds0=000; mds1=001; mds2=010; mds3=011;
    cam0=100; cam1=001; cam2=010; cam3=011;
    access_code=191;
    #10;
    //Sec1
    fire=0; earth_quake=0;
    mds0=000; mds1=001; mds2=010; mds3=011;
    cam0=000; cam1=101; cam2=010; cam3=011;
    access_code=200;
    #10;
    //Sec2
    fire=0; earth_quake=0;
    mds0=000; mds1=001; mds2=010; mds3=011;
    cam0=000; cam1=001; cam2=110; cam3=011;
    access_code=337;
    #10;
    //Sec3
    fire=0; earth_quake=0;
    mds0=000; mds1=001; mds2=010; mds3=011;
    cam0=000; cam1=001; cam2=010; cam3=111;
    access_code=123;
    #10;

    // Motion Detection System
    // mds0
    fire=0; earth_quake=0;
    mds0=000; mds1=001; mds2=010; mds3=011;
    cam0=000; cam1=001; cam2=010; cam3=011;
    access_code=123;
    #10;
    //mds1
    fire=0; earth_quake=0;
    mds0=000; mds1=001; mds2=010; mds3=011;
    cam0=000; cam1=001; cam2=010; cam3=011;
    access_code=123;
    #10;
    //mds2
    fire=0; earth_quake=0;
    mds0=000; mds1=001; mds2=010; mds3=011;
    cam0=000; cam1=001; cam2=010; cam3=011;
    access_code=123;
    #10;
    //mds3
    fire=0; earth_quake=0;
    mds0=000; mds1=001; mds2=010; mds3=011;
    cam0=000; cam1=001; cam2=010; cam3=011;
    access_code=123;
    #10;

    //Fire and Calamity Detection
    fire=1; earth_quake=0;
    mds0=000; mds1=001; mds2=010; mds3=011;
    cam0=000; cam1=001; cam2=010; cam3=011;
    access_code=294;
    #10;
    fire=0; earth_quake=1;
    mds0=000; mds1=001; mds2=010; mds3=011;
    cam0=000; cam1=001; cam2=010; cam3=011;
    access_code=191;
    #10;
    fire=1; earth_quake=1;
    mds0=000; mds1=001; mds2=010; mds3=011;
    cam0=000; cam1=001; cam2=010; cam3=011;
    access_code=223;
    #10;
    //continues..
end
endmodule
