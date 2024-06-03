module alarm_set(
    input clk,
    input reset,               
    input alarm_mode,       
    input inc_hours,
    input inc_minutes,
    input inc_seconds,
    output reg [4:0] alarm_hours,
    output reg [5:0] alarm_minutes,
    output reg [5:0] alarm_seconds
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            alarm_hours <= 0;
            alarm_minutes <= 0;
            alarm_seconds <= 0;
        end else if (alarm_mode) begin
            if (inc_hours) begin
                if (alarm_hours == 23)
                    alarm_hours <= 0;
                else
                    alarm_hours <= alarm_hours + 1;
            end
            if (inc_minutes) begin
                if (alarm_minutes == 59)
                    alarm_minutes <= 0;
                else
                    alarm_minutes <= alarm_minutes + 1;
            end
            if (inc_seconds) begin
                if (alarm_seconds == 59)
                    alarm_seconds <= 0;
                else
                    alarm_seconds <= alarm_seconds + 1;
            end
        end
    end
endmodule
