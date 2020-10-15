-- 1
update employees set email = 'not available';

-- 2
update employees set (email, commission_pct) = ('not available', 0.10)

-- 3
update employees set (email, commission_pct) = ('not available', 0.10)
  where department_id = 110;

-- 4
update employees set email = 'not available'
  where department_id = 80 and commission_pct < 0.2;

-- 5
update employees set email = 'not available'
join departments using (department_id)
  where department_name = 'Accounting';

-- 6
update employees set salary = 8000
  where employee_id = 105 and salary < 5000;

-- 7
update employees set job_id = 'SH_CLERK'
  where employee_id = 118 and
        department_id = 30 and
        job_id not like 'SH%';

-- 8
update employees set salary = case department_id
    when 40 then salary * 1.25
    when 90 then salary * 1.15
    when 110 then salary * 1.1
  end
  where department_id in (40, 90, 110);

-- 9
update employees
join jobs using (job_id) set
    min_salary = min_salary + 2000,
    max_salary = max_salary + 2000,
    salary = salary * 1.2,
    commission_pct = commission_pct + 0.1
  where job_id = 'PU_CLERK';
