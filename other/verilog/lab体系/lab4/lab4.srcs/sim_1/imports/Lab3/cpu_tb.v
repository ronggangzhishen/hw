`timescale 1ns / 1ps

module cpu_tb();
    reg clk = 1'b1;
    reg rst = 1'b1;
    
    always  #2 clk = ~clk;
    initial #8 rst = 1'b0;
    

    wire debug_miss;
    wire debug_req_signal;
    wire debug_branch, debug_predict_success, debug_predict_fail;

    RV32ICore RV32ICore_tb_inst(
        .CPU_CLK    ( clk          ),
        .CPU_RST    ( rst          ),
        .debug_miss(debug_miss),
        .debug_req_signal(debug_req_signal),
        .debug_branch(debug_branch),
        .debug_predict_success(debug_predict_success),
        .debug_predict_fail(debug_predict_fail)
    );
    
    reg [31:0] req_count, miss_count;
    reg [31:0] branch_count, branch_success_count, branch_fail_count;
    initial 
    begin
        req_count = 0;
        miss_count = 0;
        branch_count = 0;
        branch_success_count = 0;
        branch_fail_count = 0;
    end
    always @ (posedge debug_miss)
    begin
        miss_count <= miss_count+1;
    end
    always @ (posedge debug_req_signal)
    begin
        req_count <= req_count+1;
    end
    always @ (posedge clk)
    begin
        if (debug_branch)
            branch_count <= branch_count+1;
        if (debug_predict_success)
            branch_success_count <= branch_success_count+1;
        if (debug_predict_fail)
            branch_fail_count <= branch_fail_count+1;
    end
    /*
    always @ (posedge debug_branch)
    begin
        branch_count <= branch_count+1;
    end
    always @ (posedge debug_predict_success)
    begin
        branch_success_count <= branch_success_count+1;
    end
    always @ (posedge debug_predict_fail)
    begin
        branch_fail_count <= branch_fail_count+1;
    end
    */
endmodule
