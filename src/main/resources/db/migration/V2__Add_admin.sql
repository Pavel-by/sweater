INSERT INTO usr (id, username, password, active)
  VALUES (1, 'admin', '\$2a\$08$5JxPjpBo3aCMPO1DQ7teZO0576liLp94TNXjsq3ynYdVKizhzLrWO', true);

INSERT INTO user_role (user_id, roles)
  VALUES (1, 'USER'), (1, 'ADMIN');