function [ finish_times , drop_times ] = sim_queue( arrival_times , service_times , q_length )

finish_times = zeros(length(arrival_times), 1);
drop_times = zeros(length(arrival_times), 1);
queue = linspace(0, 0, q_length+1);
next_queue_slot = 1;
finish_cursor = 1;
drop_cursor = 1;

task_end_time = -1;
incoming_task = 1;
msg_in_queue = next_queue_slot - 2;
while (incoming_task > 0 || msg_in_queue >= 0) 
    if (msg_in_queue >= 0 && (incoming_task == 0 || arrival_times(incoming_task) >= task_end_time))
        current_time = task_end_time;
        queue = circshift(queue, -1);
        finish_times(finish_cursor) = current_time;
        finish_cursor = finish_cursor + 1;
        next_queue_slot = next_queue_slot - 1;
        task_end_time = current_time + queue(1);
    else
        current_time = arrival_times(incoming_task);
        if (msg_in_queue == q_length)
            drop_times(drop_cursor) = current_time;
            drop_cursor = drop_cursor + 1;
        else
            queue(next_queue_slot) = service_times(incoming_task);
            if (msg_in_queue == -1)
                task_end_time = current_time + queue(1);
            end
            next_queue_slot = next_queue_slot + 1;
        end
        incoming_task = incoming_task + 1;
        if (incoming_task > length(arrival_times))
            incoming_task = 0;
        end
    end
    msg_in_queue = next_queue_slot - 2;
end
finish_times = finish_times(1:finish_cursor-1);
drop_times = drop_times(1:drop_cursor-1);
end
