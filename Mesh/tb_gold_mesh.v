`timescale 1ns/1ns

module tb;

  // Clock and reset
  reg clk, reset, polarity;

  // Inputs for NIC_si from 00 to 33
  reg NIC_si_00, NIC_si_01, NIC_si_02, NIC_si_03;
  reg NIC_si_10, NIC_si_11, NIC_si_12, NIC_si_13;
  reg NIC_si_20, NIC_si_21, NIC_si_22, NIC_si_23;
  reg NIC_si_30, NIC_si_31, NIC_si_32, NIC_si_33;

  // Inputs for NIC_di from 00 to 33
  reg [63:0] NIC_di_00, NIC_di_01, NIC_di_02, NIC_di_03;
  reg [63:0] NIC_di_10, NIC_di_11, NIC_di_12, NIC_di_13;
  reg [63:0] NIC_di_20, NIC_di_21, NIC_di_22, NIC_di_23;
  reg [63:0] NIC_di_30, NIC_di_31, NIC_di_32, NIC_di_33;

  // Outputs for NIC_ri from 00 to 33
  wire NIC_ri_00, NIC_ri_01, NIC_ri_02, NIC_ri_03;
  wire NIC_ri_10, NIC_ri_11, NIC_ri_12, NIC_ri_13;
  wire NIC_ri_20, NIC_ri_21, NIC_ri_22, NIC_ri_23;
  wire NIC_ri_30, NIC_ri_31, NIC_ri_32, NIC_ri_33;

  // Outputs for NIC_so from 00 to 33
  wire NIC_so_00, NIC_so_01, NIC_so_02, NIC_so_03;
  wire NIC_so_10, NIC_so_11, NIC_so_12, NIC_so_13;
  wire NIC_so_20, NIC_so_21, NIC_so_22, NIC_so_23;
  wire NIC_so_30, NIC_so_31, NIC_so_32, NIC_so_33;

  // Outputs for NIC_do from 00 to 33
  wire [63:0] NIC_do_00, NIC_do_01, NIC_do_02, NIC_do_03;
  wire [63:0] NIC_do_10, NIC_do_11, NIC_do_12, NIC_do_13;
  wire [63:0] NIC_do_20, NIC_do_21, NIC_do_22, NIC_do_23;
  wire [63:0] NIC_do_30, NIC_do_31, NIC_do_32, NIC_do_33;

  // Inputs for NIC_ro from 00 to 33
  reg NIC_ro_00, NIC_ro_01, NIC_ro_02, NIC_ro_03;
  reg NIC_ro_10, NIC_ro_11, NIC_ro_12, NIC_ro_13;
  reg NIC_ro_20, NIC_ro_21, NIC_ro_22, NIC_ro_23;
  reg NIC_ro_30, NIC_ro_31, NIC_ro_32, NIC_ro_33;

  integer fd;
  integer fd1;
  
  // Instantiating the Mesh module
  gold_mesh uut (
    .clk(clk), .reset(reset), .polarity(polarity),
    .NIC_si_00(NIC_si_00), .NIC_si_01(NIC_si_01), .NIC_si_02(NIC_si_02), .NIC_si_03(NIC_si_03),
    .NIC_si_10(NIC_si_10), .NIC_si_11(NIC_si_11), .NIC_si_12(NIC_si_12), .NIC_si_13(NIC_si_13),
    .NIC_si_20(NIC_si_20), .NIC_si_21(NIC_si_21), .NIC_si_22(NIC_si_22), .NIC_si_23(NIC_si_23),
    .NIC_si_30(NIC_si_30), .NIC_si_31(NIC_si_31), .NIC_si_32(NIC_si_32), .NIC_si_33(NIC_si_33),
    .NIC_di_00(NIC_di_00), .NIC_di_01(NIC_di_01), .NIC_di_02(NIC_di_02), .NIC_di_03(NIC_di_03),
    .NIC_di_10(NIC_di_10), .NIC_di_11(NIC_di_11), .NIC_di_12(NIC_di_12), .NIC_di_13(NIC_di_13),
    .NIC_di_20(NIC_di_20), .NIC_di_21(NIC_di_21), .NIC_di_22(NIC_di_22), .NIC_di_23(NIC_di_23),
    .NIC_di_30(NIC_di_30), .NIC_di_31(NIC_di_31), .NIC_di_32(NIC_di_32), .NIC_di_33(NIC_di_33),
    .NIC_ri_00(NIC_ri_00), .NIC_ri_01(NIC_ri_01), .NIC_ri_02(NIC_ri_02), .NIC_ri_03(NIC_ri_03),
    .NIC_ri_10(NIC_ri_10), .NIC_ri_11(NIC_ri_11), .NIC_ri_12(NIC_ri_12), .NIC_ri_13(NIC_ri_13),
    .NIC_ri_20(NIC_ri_20), .NIC_ri_21(NIC_ri_21), .NIC_ri_22(NIC_ri_22), .NIC_ri_23(NIC_ri_23),
    .NIC_ri_30(NIC_ri_30), .NIC_ri_31(NIC_ri_31), .NIC_ri_32(NIC_ri_32), .NIC_ri_33(NIC_ri_33),
    .NIC_so_00(NIC_so_00), .NIC_so_01(NIC_so_01), .NIC_so_02(NIC_so_02), .NIC_so_03(NIC_so_03),
    .NIC_so_10(NIC_so_10), .NIC_so_11(NIC_so_11), .NIC_so_12(NIC_so_12), .NIC_so_13(NIC_so_13),
    .NIC_so_20(NIC_so_20), .NIC_so_21(NIC_so_21), .NIC_so_22(NIC_so_22), .NIC_so_23(NIC_so_23),
    .NIC_so_30(NIC_so_30), .NIC_so_31(NIC_so_31), .NIC_so_32(NIC_so_32), .NIC_so_33(NIC_so_33),
    .NIC_do_00(NIC_do_00), .NIC_do_01(NIC_do_01), .NIC_do_02(NIC_do_02), .NIC_do_03(NIC_do_03),
    .NIC_do_10(NIC_do_10), .NIC_do_11(NIC_do_11), .NIC_do_12(NIC_do_12), .NIC_do_13(NIC_do_13),
    .NIC_do_20(NIC_do_20), .NIC_do_21(NIC_do_21), .NIC_do_22(NIC_do_22), .NIC_do_23(NIC_do_23),
    .NIC_do_30(NIC_do_30), .NIC_do_31(NIC_do_31), .NIC_do_32(NIC_do_32), .NIC_do_33(NIC_do_33),
    .NIC_ro_00(NIC_ro_00), .NIC_ro_01(NIC_ro_01), .NIC_ro_02(NIC_ro_02), .NIC_ro_03(NIC_ro_03),
    .NIC_ro_10(NIC_ro_10), .NIC_ro_11(NIC_ro_11), .NIC_ro_12(NIC_ro_12), .NIC_ro_13(NIC_ro_13),
    .NIC_ro_20(NIC_ro_20), .NIC_ro_21(NIC_ro_21), .NIC_ro_22(NIC_ro_22), .NIC_ro_23(NIC_ro_23),
    .NIC_ro_30(NIC_ro_30), .NIC_ro_31(NIC_ro_31), .NIC_ro_32(NIC_ro_32), .NIC_ro_33(NIC_ro_33));


	// Clock generation
  initial begin
    clk = 0;
    forever #2 clk = ~clk;
  end
  
  initial begin
    polarity = 0;
    forever #4 polarity = ~polarity;
  end


  initial begin
	fd1 = $fopen("start_end_time.out","w");
    $write("Test Started\n");
    
    //$monitor("Time = %0t Source = %0h%0h",$time, NIC_do_33[43:40], NIC_do_33[35:32]);
    
    // Asserting Reset
    reset = 1'b1;
    #16
    
    // De-asserting Reset
    reset = 1'b0;
    
    /* Initial test
    // Source Node
    NIC_si_00 = 1;
    NIC_di_00 = 64'h8033_0000_0000_aa00;
    
    NIC_si_30 = 1;
    NIC_di_30 = 64'h8003_0300_0000_bb00;
    
    // Destination Node
    NIC_ro_33 = 1;
    
    #8;
    
    NIC_si_00 = 0;
    NIC_si_30 = 0;
    */
    
	//Phase 00
//Phase 00
$fwrite(fd1,"Starting Phase - 00 at Time = %0t\n",$time);
fd = $fopen ("gather_phase00.res","w");
$fmonitor(fd,"Phase =  00, Time = %0t, Destination = 00, Source = %0h%0h, Packet Value = %0h", $time, NIC_do_00[43:40], NIC_do_00[35:32], NIC_do_00);
NIC_ro_00 = 1;
NIC_si_01 = 1;
NIC_di_01 = 64'h800f000100000000;
NIC_si_02 = 1;
NIC_di_02 = 64'h800e000200000000;
NIC_si_03 = 1;
NIC_di_03 = 64'h800d000300000000;
NIC_si_10 = 1;
NIC_di_10 = 64'h80f0010000000000;
NIC_si_11 = 1;
NIC_di_11 = 64'h80ff010100000000;
NIC_si_12 = 1;
NIC_di_12 = 64'h80fe010200000000;
NIC_si_13 = 1;
NIC_di_13 = 64'h80fd010300000000;
NIC_si_20 = 1;
NIC_di_20 = 64'h80e0020000000000;
NIC_si_21 = 1;
NIC_di_21 = 64'h80ef020100000000;
NIC_si_22 = 1;
NIC_di_22 = 64'h80ee020200000000;
NIC_si_23 = 1;
NIC_di_23 = 64'h80ed020300000000;
NIC_si_30 = 1;
NIC_di_30 = 64'h80d0030000000000;
NIC_si_31 = 1;
NIC_di_31 = 64'h80df030100000000;
NIC_si_32 = 1;
NIC_di_32 = 64'h80de030200000000;
NIC_si_33 = 1;
NIC_di_33 = 64'h80dd030300000000;
#8;
NIC_si_00 = 0;
NIC_si_01 = 0;
NIC_si_02 = 0;
NIC_si_03 = 0;
NIC_si_10 = 0;
NIC_si_11 = 0;
NIC_si_12 = 0;
NIC_si_13 = 0;
NIC_si_20 = 0;
NIC_si_21 = 0;
NIC_si_22 = 0;
NIC_si_23 = 0;
NIC_si_30 = 0;
NIC_si_31 = 0;
NIC_si_32 = 0;
NIC_si_33 = 0;
#120;
$fclose(fd);
$fwrite(fd1,"Ending Phase - 00 at Time = %0t\n",$time);
NIC_ro_00 = 0;
reset = 1'b1;
#16;
reset = 1'b0;
//End of Phase 00
//Phase 01
$fwrite(fd1,"Starting Phase - 01 at Time = %0t\n",$time);
fd = $fopen ("gather_phase01.res","w");
$fmonitor(fd,"Phase =  01, Time = %0t, Destination = 01, Source = %0h%0h, Packet Value = %0h", $time, NIC_do_01[43:40], NIC_do_01[35:32], NIC_do_01);
NIC_ro_01 = 1;
NIC_si_00 = 1;
NIC_di_00 = 64'h8001000000000001;
NIC_si_02 = 1;
NIC_di_02 = 64'h800f000200000001;
NIC_si_03 = 1;
NIC_di_03 = 64'h800e000300000001;
NIC_si_10 = 1;
NIC_di_10 = 64'h80f1010000000001;
NIC_si_11 = 1;
NIC_di_11 = 64'h80f0010100000001;
NIC_si_12 = 1;
NIC_di_12 = 64'h80ff010200000001;
NIC_si_13 = 1;
NIC_di_13 = 64'h80fe010300000001;
NIC_si_20 = 1;
NIC_di_20 = 64'h80e1020000000001;
NIC_si_21 = 1;
NIC_di_21 = 64'h80e0020100000001;
NIC_si_22 = 1;
NIC_di_22 = 64'h80ef020200000001;
NIC_si_23 = 1;
NIC_di_23 = 64'h80ee020300000001;
NIC_si_30 = 1;
NIC_di_30 = 64'h80d1030000000001;
NIC_si_31 = 1;
NIC_di_31 = 64'h80d0030100000001;
NIC_si_32 = 1;
NIC_di_32 = 64'h80df030200000001;
NIC_si_33 = 1;
NIC_di_33 = 64'h80de030300000001;
#8;
NIC_si_00 = 0;
NIC_si_01 = 0;
NIC_si_02 = 0;
NIC_si_03 = 0;
NIC_si_10 = 0;
NIC_si_11 = 0;
NIC_si_12 = 0;
NIC_si_13 = 0;
NIC_si_20 = 0;
NIC_si_21 = 0;
NIC_si_22 = 0;
NIC_si_23 = 0;
NIC_si_30 = 0;
NIC_si_31 = 0;
NIC_si_32 = 0;
NIC_si_33 = 0;
#120;
$fclose(fd);
$fwrite(fd1,"Ending Phase - 01 at Time = %0t\n",$time);
NIC_ro_01 = 0;
reset = 1'b1;
#16;
reset = 1'b0;
//End of Phase 01
//Phase 02
$fwrite(fd1,"Starting Phase - 02 at Time = %0t\n",$time);
fd = $fopen ("gather_phase02.res","w");
$fmonitor(fd,"Phase =  02, Time = %0t, Destination = 02, Source = %0h%0h, Packet Value = %0h", $time, NIC_do_02[43:40], NIC_do_02[35:32], NIC_do_02);
NIC_ro_02 = 1;
NIC_si_00 = 1;
NIC_di_00 = 64'h8002000000000002;
NIC_si_01 = 1;
NIC_di_01 = 64'h8001000100000002;
NIC_si_03 = 1;
NIC_di_03 = 64'h800f000300000002;
NIC_si_10 = 1;
NIC_di_10 = 64'h80f2010000000002;
NIC_si_11 = 1;
NIC_di_11 = 64'h80f1010100000002;
NIC_si_12 = 1;
NIC_di_12 = 64'h80f0010200000002;
NIC_si_13 = 1;
NIC_di_13 = 64'h80ff010300000002;
NIC_si_20 = 1;
NIC_di_20 = 64'h80e2020000000002;
NIC_si_21 = 1;
NIC_di_21 = 64'h80e1020100000002;
NIC_si_22 = 1;
NIC_di_22 = 64'h80e0020200000002;
NIC_si_23 = 1;
NIC_di_23 = 64'h80ef020300000002;
NIC_si_30 = 1;
NIC_di_30 = 64'h80d2030000000002;
NIC_si_31 = 1;
NIC_di_31 = 64'h80d1030100000002;
NIC_si_32 = 1;
NIC_di_32 = 64'h80d0030200000002;
NIC_si_33 = 1;
NIC_di_33 = 64'h80df030300000002;
#8;
NIC_si_00 = 0;
NIC_si_01 = 0;
NIC_si_02 = 0;
NIC_si_03 = 0;
NIC_si_10 = 0;
NIC_si_11 = 0;
NIC_si_12 = 0;
NIC_si_13 = 0;
NIC_si_20 = 0;
NIC_si_21 = 0;
NIC_si_22 = 0;
NIC_si_23 = 0;
NIC_si_30 = 0;
NIC_si_31 = 0;
NIC_si_32 = 0;
NIC_si_33 = 0;
#120;
$fclose(fd);
$fwrite(fd1,"Ending Phase - 02 at Time = %0t\n",$time);
NIC_ro_02 = 0;
reset = 1'b1;
#16;
reset = 1'b0;
//End of Phase 02
//Phase 03
$fwrite(fd1,"Starting Phase - 03 at Time = %0t\n",$time);
fd = $fopen ("gather_phase03.res","w");
$fmonitor(fd,"Phase =  03, Time = %0t, Destination = 03, Source = %0h%0h, Packet Value = %0h", $time, NIC_do_03[43:40], NIC_do_03[35:32], NIC_do_03);
NIC_ro_03 = 1;
NIC_si_00 = 1;
NIC_di_00 = 64'h8003000000000003;
NIC_si_01 = 1;
NIC_di_01 = 64'h8002000100000003;
NIC_si_02 = 1;
NIC_di_02 = 64'h8001000200000003;
NIC_si_10 = 1;
NIC_di_10 = 64'h80f3010000000003;
NIC_si_11 = 1;
NIC_di_11 = 64'h80f2010100000003;
NIC_si_12 = 1;
NIC_di_12 = 64'h80f1010200000003;
NIC_si_13 = 1;
NIC_di_13 = 64'h80f0010300000003;
NIC_si_20 = 1;
NIC_di_20 = 64'h80e3020000000003;
NIC_si_21 = 1;
NIC_di_21 = 64'h80e2020100000003;
NIC_si_22 = 1;
NIC_di_22 = 64'h80e1020200000003;
NIC_si_23 = 1;
NIC_di_23 = 64'h80e0020300000003;
NIC_si_30 = 1;
NIC_di_30 = 64'h80d3030000000003;
NIC_si_31 = 1;
NIC_di_31 = 64'h80d2030100000003;
NIC_si_32 = 1;
NIC_di_32 = 64'h80d1030200000003;
NIC_si_33 = 1;
NIC_di_33 = 64'h80d0030300000003;
#8;
NIC_si_00 = 0;
NIC_si_01 = 0;
NIC_si_02 = 0;
NIC_si_03 = 0;
NIC_si_10 = 0;
NIC_si_11 = 0;
NIC_si_12 = 0;
NIC_si_13 = 0;
NIC_si_20 = 0;
NIC_si_21 = 0;
NIC_si_22 = 0;
NIC_si_23 = 0;
NIC_si_30 = 0;
NIC_si_31 = 0;
NIC_si_32 = 0;
NIC_si_33 = 0;
#120;
$fclose(fd);
$fwrite(fd1,"Ending Phase - 03 at Time = %0t\n",$time);
NIC_ro_03 = 0;
reset = 1'b1;
#16;
reset = 1'b0;
//End of Phase 03
//Phase 10
$fwrite(fd1,"Starting Phase - 10 at Time = %0t\n",$time);
fd = $fopen ("gather_phase10.res","w");
$fmonitor(fd,"Phase =  10, Time = %0t, Destination = 10, Source = %0h%0h, Packet Value = %0h", $time, NIC_do_10[43:40], NIC_do_10[35:32], NIC_do_10);
NIC_ro_10 = 1;
NIC_si_00 = 1;
NIC_di_00 = 64'h8010000000000010;
NIC_si_01 = 1;
NIC_di_01 = 64'h801f000100000010;
NIC_si_02 = 1;
NIC_di_02 = 64'h801e000200000010;
NIC_si_03 = 1;
NIC_di_03 = 64'h801d000300000010;
NIC_si_11 = 1;
NIC_di_11 = 64'h800f010100000010;
NIC_si_12 = 1;
NIC_di_12 = 64'h800e010200000010;
NIC_si_13 = 1;
NIC_di_13 = 64'h800d010300000010;
NIC_si_20 = 1;
NIC_di_20 = 64'h80f0020000000010;
NIC_si_21 = 1;
NIC_di_21 = 64'h80ff020100000010;
NIC_si_22 = 1;
NIC_di_22 = 64'h80fe020200000010;
NIC_si_23 = 1;
NIC_di_23 = 64'h80fd020300000010;
NIC_si_30 = 1;
NIC_di_30 = 64'h80e0030000000010;
NIC_si_31 = 1;
NIC_di_31 = 64'h80ef030100000010;
NIC_si_32 = 1;
NIC_di_32 = 64'h80ee030200000010;
NIC_si_33 = 1;
NIC_di_33 = 64'h80ed030300000010;
#8;
NIC_si_00 = 0;
NIC_si_01 = 0;
NIC_si_02 = 0;
NIC_si_03 = 0;
NIC_si_10 = 0;
NIC_si_11 = 0;
NIC_si_12 = 0;
NIC_si_13 = 0;
NIC_si_20 = 0;
NIC_si_21 = 0;
NIC_si_22 = 0;
NIC_si_23 = 0;
NIC_si_30 = 0;
NIC_si_31 = 0;
NIC_si_32 = 0;
NIC_si_33 = 0;
#120;
$fclose(fd);
$fwrite(fd1,"Ending Phase - 10 at Time = %0t\n",$time);
NIC_ro_10 = 0;
reset = 1'b1;
#16;
reset = 1'b0;
//End of Phase 10
//Phase 11
$fwrite(fd1,"Starting Phase - 11 at Time = %0t\n",$time);
fd = $fopen ("gather_phase11.res","w");
$fmonitor(fd,"Phase =  11, Time = %0t, Destination = 11, Source = %0h%0h, Packet Value = %0h", $time, NIC_do_11[43:40], NIC_do_11[35:32], NIC_do_11);
NIC_ro_11 = 1;
NIC_si_00 = 1;
NIC_di_00 = 64'h8011000000000011;
NIC_si_01 = 1;
NIC_di_01 = 64'h8010000100000011;
NIC_si_02 = 1;
NIC_di_02 = 64'h801f000200000011;
NIC_si_03 = 1;
NIC_di_03 = 64'h801e000300000011;
NIC_si_10 = 1;
NIC_di_10 = 64'h8001010000000011;
NIC_si_12 = 1;
NIC_di_12 = 64'h800f010200000011;
NIC_si_13 = 1;
NIC_di_13 = 64'h800e010300000011;
NIC_si_20 = 1;
NIC_di_20 = 64'h80f1020000000011;
NIC_si_21 = 1;
NIC_di_21 = 64'h80f0020100000011;
NIC_si_22 = 1;
NIC_di_22 = 64'h80ff020200000011;
NIC_si_23 = 1;
NIC_di_23 = 64'h80fe020300000011;
NIC_si_30 = 1;
NIC_di_30 = 64'h80e1030000000011;
NIC_si_31 = 1;
NIC_di_31 = 64'h80e0030100000011;
NIC_si_32 = 1;
NIC_di_32 = 64'h80ef030200000011;
NIC_si_33 = 1;
NIC_di_33 = 64'h80ee030300000011;
#8;
NIC_si_00 = 0;
NIC_si_01 = 0;
NIC_si_02 = 0;
NIC_si_03 = 0;
NIC_si_10 = 0;
NIC_si_11 = 0;
NIC_si_12 = 0;
NIC_si_13 = 0;
NIC_si_20 = 0;
NIC_si_21 = 0;
NIC_si_22 = 0;
NIC_si_23 = 0;
NIC_si_30 = 0;
NIC_si_31 = 0;
NIC_si_32 = 0;
NIC_si_33 = 0;
#120;
$fclose(fd);
$fwrite(fd1,"Ending Phase - 11 at Time = %0t\n",$time);
NIC_ro_11 = 0;
reset = 1'b1;
#16;
reset = 1'b0;
//End of Phase 11
//Phase 12
$fwrite(fd1,"Starting Phase - 12 at Time = %0t\n",$time);
fd = $fopen ("gather_phase12.res","w");
$fmonitor(fd,"Phase =  12, Time = %0t, Destination = 12, Source = %0h%0h, Packet Value = %0h", $time, NIC_do_12[43:40], NIC_do_12[35:32], NIC_do_12);
NIC_ro_12 = 1;
NIC_si_00 = 1;
NIC_di_00 = 64'h8012000000000012;
NIC_si_01 = 1;
NIC_di_01 = 64'h8011000100000012;
NIC_si_02 = 1;
NIC_di_02 = 64'h8010000200000012;
NIC_si_03 = 1;
NIC_di_03 = 64'h801f000300000012;
NIC_si_10 = 1;
NIC_di_10 = 64'h8002010000000012;
NIC_si_11 = 1;
NIC_di_11 = 64'h8001010100000012;
NIC_si_13 = 1;
NIC_di_13 = 64'h800f010300000012;
NIC_si_20 = 1;
NIC_di_20 = 64'h80f2020000000012;
NIC_si_21 = 1;
NIC_di_21 = 64'h80f1020100000012;
NIC_si_22 = 1;
NIC_di_22 = 64'h80f0020200000012;
NIC_si_23 = 1;
NIC_di_23 = 64'h80ff020300000012;
NIC_si_30 = 1;
NIC_di_30 = 64'h80e2030000000012;
NIC_si_31 = 1;
NIC_di_31 = 64'h80e1030100000012;
NIC_si_32 = 1;
NIC_di_32 = 64'h80e0030200000012;
NIC_si_33 = 1;
NIC_di_33 = 64'h80ef030300000012;
#8;
NIC_si_00 = 0;
NIC_si_01 = 0;
NIC_si_02 = 0;
NIC_si_03 = 0;
NIC_si_10 = 0;
NIC_si_11 = 0;
NIC_si_12 = 0;
NIC_si_13 = 0;
NIC_si_20 = 0;
NIC_si_21 = 0;
NIC_si_22 = 0;
NIC_si_23 = 0;
NIC_si_30 = 0;
NIC_si_31 = 0;
NIC_si_32 = 0;
NIC_si_33 = 0;
#120;
$fclose(fd);
$fwrite(fd1,"Ending Phase - 12 at Time = %0t\n",$time);
NIC_ro_12 = 0;
reset = 1'b1;
#16;
reset = 1'b0;
//End of Phase 12
//Phase 13
$fwrite(fd1,"Starting Phase - 13 at Time = %0t\n",$time);
fd = $fopen ("gather_phase13.res","w");
$fmonitor(fd,"Phase =  13, Time = %0t, Destination = 13, Source = %0h%0h, Packet Value = %0h", $time, NIC_do_13[43:40], NIC_do_13[35:32], NIC_do_13);
NIC_ro_13 = 1;
NIC_si_00 = 1;
NIC_di_00 = 64'h8013000000000013;
NIC_si_01 = 1;
NIC_di_01 = 64'h8012000100000013;
NIC_si_02 = 1;
NIC_di_02 = 64'h8011000200000013;
NIC_si_03 = 1;
NIC_di_03 = 64'h8010000300000013;
NIC_si_10 = 1;
NIC_di_10 = 64'h8003010000000013;
NIC_si_11 = 1;
NIC_di_11 = 64'h8002010100000013;
NIC_si_12 = 1;
NIC_di_12 = 64'h8001010200000013;
NIC_si_20 = 1;
NIC_di_20 = 64'h80f3020000000013;
NIC_si_21 = 1;
NIC_di_21 = 64'h80f2020100000013;
NIC_si_22 = 1;
NIC_di_22 = 64'h80f1020200000013;
NIC_si_23 = 1;
NIC_di_23 = 64'h80f0020300000013;
NIC_si_30 = 1;
NIC_di_30 = 64'h80e3030000000013;
NIC_si_31 = 1;
NIC_di_31 = 64'h80e2030100000013;
NIC_si_32 = 1;
NIC_di_32 = 64'h80e1030200000013;
NIC_si_33 = 1;
NIC_di_33 = 64'h80e0030300000013;
#8;
NIC_si_00 = 0;
NIC_si_01 = 0;
NIC_si_02 = 0;
NIC_si_03 = 0;
NIC_si_10 = 0;
NIC_si_11 = 0;
NIC_si_12 = 0;
NIC_si_13 = 0;
NIC_si_20 = 0;
NIC_si_21 = 0;
NIC_si_22 = 0;
NIC_si_23 = 0;
NIC_si_30 = 0;
NIC_si_31 = 0;
NIC_si_32 = 0;
NIC_si_33 = 0;
#120;
$fclose(fd);
$fwrite(fd1,"Ending Phase - 13 at Time = %0t\n",$time);
NIC_ro_13 = 0;
reset = 1'b1;
#16;
reset = 1'b0;
//End of Phase 13
//Phase 20
$fwrite(fd1,"Starting Phase - 20 at Time = %0t\n",$time);
fd = $fopen ("gather_phase20.res","w");
$fmonitor(fd,"Phase =  20, Time = %0t, Destination = 20, Source = %0h%0h, Packet Value = %0h", $time, NIC_do_20[43:40], NIC_do_20[35:32], NIC_do_20);
NIC_ro_20 = 1;
NIC_si_00 = 1;
NIC_di_00 = 64'h6020000000000020;
NIC_si_01 = 1;
NIC_di_01 = 64'h602f000100000020;
NIC_si_02 = 1;
NIC_di_02 = 64'h602e000200000020;
NIC_si_03 = 1;
NIC_di_03 = 64'h402d000300000020;
NIC_si_10 = 1;
NIC_di_10 = 64'h6010010000000020;
NIC_si_11 = 1;
NIC_di_11 = 64'h601f010100000020;
NIC_si_12 = 1;
NIC_di_12 = 64'h601e010200000020;
NIC_si_13 = 1;
NIC_di_13 = 64'h401d010300000020;
NIC_si_21 = 1;
NIC_di_21 = 64'he00f020100000020;
NIC_si_22 = 1;
NIC_di_22 = 64'he00e020200000020;
NIC_si_23 = 1;
NIC_di_23 = 64'hc00d020300000020;
NIC_si_30 = 1;
NIC_di_30 = 64'ha0f0030000000020;
NIC_si_31 = 1;
NIC_di_31 = 64'ha0ff030100000020;
NIC_si_32 = 1;
NIC_di_32 = 64'ha0fe030200000020;
NIC_si_33 = 1;
NIC_di_33 = 64'h80fd030300000020;
#8;
NIC_si_00 = 0;
NIC_si_01 = 0;
NIC_si_02 = 0;
NIC_si_03 = 0;
NIC_si_10 = 0;
NIC_si_11 = 0;
NIC_si_12 = 0;
NIC_si_13 = 0;
NIC_si_20 = 0;
NIC_si_21 = 0;
NIC_si_22 = 0;
NIC_si_23 = 0;
NIC_si_30 = 0;
NIC_si_31 = 0;
NIC_si_32 = 0;
NIC_si_33 = 0;
#120;
$fclose(fd);
$fwrite(fd1,"Ending Phase - 20 at Time = %0t\n",$time);
NIC_ro_20 = 0;
reset = 1'b1;
#16;
reset = 1'b0;
//End of Phase 20
//Phase 21
$fwrite(fd1,"Starting Phase - 21 at Time = %0t\n",$time);
fd = $fopen ("gather_phase21.res","w");
$fmonitor(fd,"Phase =  21, Time = %0t, Destination = 21, Source = %0h%0h, Packet Value = %0h", $time, NIC_do_21[43:40], NIC_do_21[35:32], NIC_do_21);
NIC_ro_21 = 1;
NIC_si_00 = 1;
NIC_di_00 = 64'h8021000000000021;
NIC_si_01 = 1;
NIC_di_01 = 64'h8020000100000021;
NIC_si_02 = 1;
NIC_di_02 = 64'h802f000200000021;
NIC_si_03 = 1;
NIC_di_03 = 64'h802e000300000021;
NIC_si_10 = 1;
NIC_di_10 = 64'h8011010000000021;
NIC_si_11 = 1;
NIC_di_11 = 64'h8010010100000021;
NIC_si_12 = 1;
NIC_di_12 = 64'h801f010200000021;
NIC_si_13 = 1;
NIC_di_13 = 64'h801e010300000021;
NIC_si_20 = 1;
NIC_di_20 = 64'h8001020000000021;
NIC_si_22 = 1;
NIC_di_22 = 64'h800f020200000021;
NIC_si_23 = 1;
NIC_di_23 = 64'h800e020300000021;
NIC_si_30 = 1;
NIC_di_30 = 64'h80f1030000000021;
NIC_si_31 = 1;
NIC_di_31 = 64'h80f0030100000021;
NIC_si_32 = 1;
NIC_di_32 = 64'h80ff030200000021;
NIC_si_33 = 1;
NIC_di_33 = 64'h80fe030300000021;
#8;
NIC_si_00 = 0;
NIC_si_01 = 0;
NIC_si_02 = 0;
NIC_si_03 = 0;
NIC_si_10 = 0;
NIC_si_11 = 0;
NIC_si_12 = 0;
NIC_si_13 = 0;
NIC_si_20 = 0;
NIC_si_21 = 0;
NIC_si_22 = 0;
NIC_si_23 = 0;
NIC_si_30 = 0;
NIC_si_31 = 0;
NIC_si_32 = 0;
NIC_si_33 = 0;
#120;
$fclose(fd);
$fwrite(fd1,"Ending Phase - 21 at Time = %0t\n",$time);
NIC_ro_21 = 0;
reset = 1'b1;
#16;
reset = 1'b0;
//End of Phase 21
//Phase 22
$fwrite(fd1,"Starting Phase - 22 at Time = %0t\n",$time);
fd = $fopen ("gather_phase22.res","w");
$fmonitor(fd,"Phase =  22, Time = %0t, Destination = 22, Source = %0h%0h, Packet Value = %0h", $time, NIC_do_22[43:40], NIC_do_22[35:32], NIC_do_22);
NIC_ro_22 = 1;
NIC_si_00 = 1;
NIC_di_00 = 64'h8022000000000022;
NIC_si_01 = 1;
NIC_di_01 = 64'h8021000100000022;
NIC_si_02 = 1;
NIC_di_02 = 64'h8020000200000022;
NIC_si_03 = 1;
NIC_di_03 = 64'h802f000300000022;
NIC_si_10 = 1;
NIC_di_10 = 64'h8012010000000022;
NIC_si_11 = 1;
NIC_di_11 = 64'h8011010100000022;
NIC_si_12 = 1;
NIC_di_12 = 64'h8010010200000022;
NIC_si_13 = 1;
NIC_di_13 = 64'h801f010300000022;
NIC_si_20 = 1;
NIC_di_20 = 64'h8002020000000022;
NIC_si_21 = 1;
NIC_di_21 = 64'h8001020100000022;
NIC_si_23 = 1;
NIC_di_23 = 64'h800f020300000022;
NIC_si_30 = 1;
NIC_di_30 = 64'h80f2030000000022;
NIC_si_31 = 1;
NIC_di_31 = 64'h80f1030100000022;
NIC_si_32 = 1;
NIC_di_32 = 64'h80f0030200000022;
NIC_si_33 = 1;
NIC_di_33 = 64'h80ff030300000022;
#8;
NIC_si_00 = 0;
NIC_si_01 = 0;
NIC_si_02 = 0;
NIC_si_03 = 0;
NIC_si_10 = 0;
NIC_si_11 = 0;
NIC_si_12 = 0;
NIC_si_13 = 0;
NIC_si_20 = 0;
NIC_si_21 = 0;
NIC_si_22 = 0;
NIC_si_23 = 0;
NIC_si_30 = 0;
NIC_si_31 = 0;
NIC_si_32 = 0;
NIC_si_33 = 0;
#120;
$fclose(fd);
$fwrite(fd1,"Ending Phase - 22 at Time = %0t\n",$time);
NIC_ro_22 = 0;
reset = 1'b1;
#16;
reset = 1'b0;
//End of Phase 22
//Phase 23
$fwrite(fd1,"Starting Phase - 23 at Time = %0t\n",$time);
fd = $fopen ("gather_phase23.res","w");
$fmonitor(fd,"Phase =  23, Time = %0t, Destination = 23, Source = %0h%0h, Packet Value = %0h", $time, NIC_do_23[43:40], NIC_do_23[35:32], NIC_do_23);
NIC_ro_23 = 1;
NIC_si_00 = 1;
NIC_di_00 = 64'h8023000000000023;
NIC_si_01 = 1;
NIC_di_01 = 64'h8022000100000023;
NIC_si_02 = 1;
NIC_di_02 = 64'h8021000200000023;
NIC_si_03 = 1;
NIC_di_03 = 64'h8020000300000023;
NIC_si_10 = 1;
NIC_di_10 = 64'h8013010000000023;
NIC_si_11 = 1;
NIC_di_11 = 64'h8012010100000023;
NIC_si_12 = 1;
NIC_di_12 = 64'h8011010200000023;
NIC_si_13 = 1;
NIC_di_13 = 64'h8010010300000023;
NIC_si_20 = 1;
NIC_di_20 = 64'h8003020000000023;
NIC_si_21 = 1;
NIC_di_21 = 64'h8002020100000023;
NIC_si_22 = 1;
NIC_di_22 = 64'h8001020200000023;
NIC_si_30 = 1;
NIC_di_30 = 64'h80f3030000000023;
NIC_si_31 = 1;
NIC_di_31 = 64'h80f2030100000023;
NIC_si_32 = 1;
NIC_di_32 = 64'h80f1030200000023;
NIC_si_33 = 1;
NIC_di_33 = 64'h80f0030300000023;
#8;
NIC_si_00 = 0;
NIC_si_01 = 0;
NIC_si_02 = 0;
NIC_si_03 = 0;
NIC_si_10 = 0;
NIC_si_11 = 0;
NIC_si_12 = 0;
NIC_si_13 = 0;
NIC_si_20 = 0;
NIC_si_21 = 0;
NIC_si_22 = 0;
NIC_si_23 = 0;
NIC_si_30 = 0;
NIC_si_31 = 0;
NIC_si_32 = 0;
NIC_si_33 = 0;
#120;
$fclose(fd);
$fwrite(fd1,"Ending Phase - 23 at Time = %0t\n",$time);
NIC_ro_23 = 0;
reset = 1'b1;
#16;
reset = 1'b0;
//End of Phase 23
//Phase 30
$fwrite(fd1,"Starting Phase - 30 at Time = %0t\n",$time);
fd = $fopen ("gather_phase30.res","w");
$fmonitor(fd,"Phase =  30, Time = %0t, Destination = 30, Source = %0h%0h, Packet Value = %0h", $time, NIC_do_30[43:40], NIC_do_30[35:32], NIC_do_30);
NIC_ro_30 = 1;
NIC_si_00 = 1;
NIC_di_00 = 64'h6030000000000030;
NIC_si_01 = 1;
NIC_di_01 = 64'h603f000100000030;
NIC_si_02 = 1;
NIC_di_02 = 64'h603e000200000030;
NIC_si_03 = 1;
NIC_di_03 = 64'h603d000300000030;
NIC_si_10 = 1;
NIC_di_10 = 64'h6020010000000030;
NIC_si_11 = 1;
NIC_di_11 = 64'h602f010100000030;
NIC_si_12 = 1;
NIC_di_12 = 64'h602e010200000030;
NIC_si_13 = 1;
NIC_di_13 = 64'h602d010300000030;
NIC_si_20 = 1;
NIC_di_20 = 64'he010020000000030;
NIC_si_21 = 1;
NIC_di_21 = 64'he01f020100000030;
NIC_si_22 = 1;
NIC_di_22 = 64'he01e020200000030;
NIC_si_23 = 1;
NIC_di_23 = 64'he01d020300000030;
NIC_si_31 = 1;
NIC_di_31 = 64'he00f030100000030;
NIC_si_32 = 1;
NIC_di_32 = 64'he00e030200000030;
NIC_si_33 = 1;
NIC_di_33 = 64'he00d030300000030;
#8;
NIC_si_00 = 0;
NIC_si_01 = 0;
NIC_si_02 = 0;
NIC_si_03 = 0;
NIC_si_10 = 0;
NIC_si_11 = 0;
NIC_si_12 = 0;
NIC_si_13 = 0;
NIC_si_20 = 0;
NIC_si_21 = 0;
NIC_si_22 = 0;
NIC_si_23 = 0;
NIC_si_30 = 0;
NIC_si_31 = 0;
NIC_si_32 = 0;
NIC_si_33 = 0;
#120;
$fclose(fd);
$fwrite(fd1,"Ending Phase - 30 at Time = %0t\n",$time);
NIC_ro_30 = 0;
reset = 1'b1;
#16;
reset = 1'b0;
//End of Phase 30
//Phase 31
$fwrite(fd1,"Starting Phase - 31 at Time = %0t\n",$time);
fd = $fopen ("gather_phase31.res","w");
$fmonitor(fd,"Phase =  31, Time = %0t, Destination = 31, Source = %0h%0h, Packet Value = %0h", $time, NIC_do_31[43:40], NIC_do_31[35:32], NIC_do_31);
NIC_ro_31 = 1;
NIC_si_00 = 1;
NIC_di_00 = 64'h8031000000000031;
NIC_si_01 = 1;
NIC_di_01 = 64'h8030000100000031;
NIC_si_02 = 1;
NIC_di_02 = 64'h803f000200000031;
NIC_si_03 = 1;
NIC_di_03 = 64'h803e000300000031;
NIC_si_10 = 1;
NIC_di_10 = 64'h8021010000000031;
NIC_si_11 = 1;
NIC_di_11 = 64'h8020010100000031;
NIC_si_12 = 1;
NIC_di_12 = 64'h802f010200000031;
NIC_si_13 = 1;
NIC_di_13 = 64'h802e010300000031;
NIC_si_20 = 1;
NIC_di_20 = 64'h8011020000000031;
NIC_si_21 = 1;
NIC_di_21 = 64'h8010020100000031;
NIC_si_22 = 1;
NIC_di_22 = 64'h801f020200000031;
NIC_si_23 = 1;
NIC_di_23 = 64'h801e020300000031;
NIC_si_30 = 1;
NIC_di_30 = 64'h8001030000000031;
NIC_si_32 = 1;
NIC_di_32 = 64'h800f030200000031;
NIC_si_33 = 1;
NIC_di_33 = 64'h800e030300000031;
#8;
NIC_si_00 = 0;
NIC_si_01 = 0;
NIC_si_02 = 0;
NIC_si_03 = 0;
NIC_si_10 = 0;
NIC_si_11 = 0;
NIC_si_12 = 0;
NIC_si_13 = 0;
NIC_si_20 = 0;
NIC_si_21 = 0;
NIC_si_22 = 0;
NIC_si_23 = 0;
NIC_si_30 = 0;
NIC_si_31 = 0;
NIC_si_32 = 0;
NIC_si_33 = 0;
#120;
$fclose(fd);
$fwrite(fd1,"Ending Phase - 31 at Time = %0t\n",$time);
NIC_ro_31 = 0;
reset = 1'b1;
#16;
reset = 1'b0;
//End of Phase 31
//Phase 32
$fwrite(fd1,"Starting Phase - 32 at Time = %0t\n",$time);
fd = $fopen ("gather_phase32.res","w");
$fmonitor(fd,"Phase =  32, Time = %0t, Destination = 32, Source = %0h%0h, Packet Value = %0h", $time, NIC_do_32[43:40], NIC_do_32[35:32], NIC_do_32);
NIC_ro_32 = 1;
NIC_si_00 = 1;
NIC_di_00 = 64'h6032000000000032;
NIC_si_01 = 1;
NIC_di_01 = 64'h6031000100000032;
NIC_si_02 = 1;
NIC_di_02 = 64'h6030000200000032;
NIC_si_03 = 1;
NIC_di_03 = 64'h603f000300000032;
NIC_si_10 = 1;
NIC_di_10 = 64'h6022010000000032;
NIC_si_11 = 1;
NIC_di_11 = 64'h6021010100000032;
NIC_si_12 = 1;
NIC_di_12 = 64'h6020010200000032;
NIC_si_13 = 1;
NIC_di_13 = 64'h602f010300000032;
NIC_si_20 = 1;
NIC_di_20 = 64'he012020000000032;
NIC_si_21 = 1;
NIC_di_21 = 64'he011020100000032;
NIC_si_22 = 1;
NIC_di_22 = 64'he010020200000032;
NIC_si_23 = 1;
NIC_di_23 = 64'he01f020300000032;
NIC_si_30 = 1;
NIC_di_30 = 64'he002030000000032;
NIC_si_31 = 1;
NIC_di_31 = 64'he001030100000032;
NIC_si_33 = 1;
NIC_di_33 = 64'he00f030300000032;
#8;
NIC_si_00 = 0;
NIC_si_01 = 0;
NIC_si_02 = 0;
NIC_si_03 = 0;
NIC_si_10 = 0;
NIC_si_11 = 0;
NIC_si_12 = 0;
NIC_si_13 = 0;
NIC_si_20 = 0;
NIC_si_21 = 0;
NIC_si_22 = 0;
NIC_si_23 = 0;
NIC_si_30 = 0;
NIC_si_31 = 0;
NIC_si_32 = 0;
NIC_si_33 = 0;
#120;
$fclose(fd);
$fwrite(fd1,"Ending Phase - 32 at Time = %0t\n",$time);
NIC_ro_32 = 0;
reset = 1'b1;
#16;
reset = 1'b0;
//End of Phase 32
//Phase 33
$fwrite(fd1,"Starting Phase - 33 at Time = %0t\n",$time);
fd = $fopen ("gather_phase33.res","w");
$fmonitor(fd,"Phase =  33, Time = %0t, Destination = 33, Source = %0h%0h, Packet Value = %0h", $time, NIC_do_33[43:40], NIC_do_33[35:32], NIC_do_33);
NIC_ro_33 = 1;
NIC_si_00 = 1;
NIC_di_00 = 64'h6033000000000033;
NIC_si_01 = 1;
NIC_di_01 = 64'h6032000100000033;
NIC_si_02 = 1;
NIC_di_02 = 64'h6031000200000033;
NIC_si_03 = 1;
NIC_di_03 = 64'h6030000300000033;
NIC_si_10 = 1;
NIC_di_10 = 64'h6023010000000033;
NIC_si_11 = 1;
NIC_di_11 = 64'h6022010100000033;
NIC_si_12 = 1;
NIC_di_12 = 64'h6021010200000033;
NIC_si_13 = 1;
NIC_di_13 = 64'h6020010300000033;
NIC_si_20 = 1;
NIC_di_20 = 64'he013020000000033;
NIC_si_21 = 1;
NIC_di_21 = 64'he012020100000033;
NIC_si_22 = 1;
NIC_di_22 = 64'he011020200000033;
NIC_si_23 = 1;
NIC_di_23 = 64'he010020300000033;
NIC_si_30 = 1;
NIC_di_30 = 64'he003030000000033;
NIC_si_31 = 1;
NIC_di_31 = 64'he002030100000033;
NIC_si_32 = 1;
NIC_di_32 = 64'he001030200000033;
#8;
NIC_si_00 = 0;
NIC_si_01 = 0;
NIC_si_02 = 0;
NIC_si_03 = 0;
NIC_si_10 = 0;
NIC_si_11 = 0;
NIC_si_12 = 0;
NIC_si_13 = 0;
NIC_si_20 = 0;
NIC_si_21 = 0;
NIC_si_22 = 0;
NIC_si_23 = 0;
NIC_si_30 = 0;
NIC_si_31 = 0;
NIC_si_32 = 0;
NIC_si_33 = 0;
#120;
$fclose(fd);
$fwrite(fd1,"Ending Phase - 33 at Time = %0t\n",$time);
NIC_ro_33 = 0;
reset = 1'b1;
#16;
reset = 1'b0;
//End of Phase 33



#100;

    $finish;
  end

endmodule
