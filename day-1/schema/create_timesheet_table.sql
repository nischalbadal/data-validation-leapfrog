create table timesheet(
    employee_id VARCHAR(250),
    department_id VARCHAR(250),
    shift_start_time TIME,
    shift_end_time TIME,
    shift_date DATE NOT NULL,
    shift_type VARCHAR(100),
    hours_worked FLOAT,
    attendance BOOLEAN,
    has_taken_break BOOLEAN,
    break_hour FLOAT,
    was_charge BOOLEAN,
    charge_hour FLOAT,
    was_on_call BOOLEAN,
    on_call_hour FLOAT,
    num_teammates_absent INT
);

