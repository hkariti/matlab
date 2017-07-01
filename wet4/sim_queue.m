function [ finish_times , drop_times ] = sim_queue( arrival_times , service_times , q_length )

finish_times = zeros(length(arrival_times));
drop_times = zeros(length(arrival_times));
queue = linspace(0, 0, q_length+1);
current_time = 0;
next_queue_slot = 1;
finish_cursor = 1;
drop_cursor = 1;
task_end_time = -1;

for incoming_task = 1:length(arrival_times)
    msg_in_queue = next_queue_slot - 2;
    while (msg_in_queue >= 0 && arrival_times(incoming_task) >= task_end_time)
        new_time = task_end_time;
        queue = circshift(queue, -1);
        finish_times(finish_cursor) = new_time;
        finish_cursor = finish_cursor + 1;
        next_queue_slot = next_queue_slot - 1;
        msg_in_queue = next_queue_slot - 2;
        task_end_time = new_time + queue(1);
    end
    if (msg_in_queue < 0 || arrival_times(incoming_task) <= task_end_time)
        new_time = arrival_times(incoming_task);
        if (msg_in_queue == q_length)
            drop_times(drop_cursor) = new_time;
            drop_cursor = drop_cursor + 1;
        else
            queue(next_queue_slot) = service_times(incoming_task);
            if (msg_in_queue == -1)
                task_end_time = new_time + service_times(incoming_task);
            end
            next_queue_slot = next_queue_slot + 1;
        end
    end
    current_time = new_time;
end

for incoming_task = 1:next_queue_slot - 1
    if (incoming_task == 1)
        new_time = task_end_time;
    else
        new_time = current_time + queue(incoming_task);
    end
    finish_times(finish_cursor) = new_time;
    finish_cursor = finish_cursor + 1;
    current_time = new_time;
end
finish_times = transpose(finish_times(1:finish_cursor-1));
drop_times = transpose(drop_times(1:drop_cursor-1));
end

