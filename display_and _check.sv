module display_and_check(
    input alarm_mode,             
    input [5:0] seconds,          
    input [5:0] minutes,         
    input [4:0] hours,          
    input [5:0] alarm_seconds,   
    input [5:0] alarm_minutes,   
    input [4:0] alarm_hours,      
    output reg [5:0] disp_seconds, 
    output reg [5:0] disp_minutes, 
    output reg [4:0] disp_hours,   
    output reg alarm_trigger      
);

    always @(*) begin
        
        alarm_trigger = 0;

        if (alarm_mode) begin
            disp_seconds = alarm_seconds;
            disp_minutes = alarm_minutes;
            disp_hours = alarm_hours;
        end else begin
            disp_seconds = seconds;
            disp_minutes = minutes;
            disp_hours = hours;
        end

       
        if (seconds == alarm_seconds && minutes == alarm_minutes && hours == alarm_hours) begin
            alarm_trigger = 1;
        end
    end
endmodule
