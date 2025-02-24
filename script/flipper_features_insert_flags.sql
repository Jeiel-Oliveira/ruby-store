use twyg_development

select * from flipper_gates

select * from access_profiles where organization_id=12

select * from users where first_name='Yango'

-- Yango = 6

select * from access_profile_users where organization_id=12

insert into access_profile_users (access_profile_id, user_id, organization_id, created_at, updated_at)
values
	('12', '5', '4', now(), now()),
	('28', '6', '4', now(), now()),
	('35', '15', '4', now(), now())

INSERT INTO flipper_gates (feature_key, `key`, value, created_at, updated_at)
VALUES 
	('super_admin_logs', 'boolean', 'true', NOW(), NOW()),
    ('new_partners', 'boolean', 'true', NOW(), NOW()),
    ('ecosystem_tnd', 'boolean', 'true', NOW(), NOW()),
    ('new_integrations', 'boolean', 'true', NOW(), NOW()),
    ('nova_tela_de_equipe', 'boolean', 'true', NOW(), NOW()),
    ('nova_tela_de_equipes', 'boolean', 'true', NOW(), NOW()),
    ('access_twygo_academy', 'boolean', 'true', NOW(), NOW()),
    ('mobile_admin_access', 'boolean', 'true', NOW(), NOW()),
    ('pagseguro', 'boolean', 'true', NOW(), NOW()),
    ('nova_tela_de_questionarios', 'boolean', 'true', NOW(), NOW()),
    ('nova_tela_de_questionario', 'boolean', 'true', NOW(), NOW()),
    ('user_logs', 'boolean', 'true', NOW(), NOW()),
    ('login_logout_logs', 'boolean', 'true', NOW(), NOW()),
    ('community_logs', 'boolean', 'true', NOW(), NOW()),
    ('new_api_v2', 'boolean', 'true', NOW(), NOW()),
    ('access_ted_circle', 'boolean', 'true', NOW(), NOW()),
    ('new_enrollment_package_registrations', 'boolean', 'true', NOW(), NOW()),
    ('orgs_with_games', 'boolean', 'true', NOW(), NOW()),
    ('allow_copy_trial_organization', 'boolean', 'true', NOW(), NOW()),
    ('beta_tester', 'boolean', 'true', NOW(), NOW()),
    ('professional_score_new_page', 'boolean', 'true', NOW(), NOW()),
    ('chat_hubspot', 'boolean', 'true', NOW(), NOW()),
    ('hubspot_events', 'boolean', 'true', NOW(), NOW()),
    ('jivo_chat_hubspot', 'boolean', 'true', NOW(), NOW()),
    ('disable_recaptcha', 'boolean', 'true', NOW(), NOW()),
    ('assistive', 'boolean', 'true', NOW(), NOW()),
    ('nova_geracao_certificado', 'boolean', 'true', NOW(), NOW()),
    ('novo_ecossistema_ambiente', 'boolean', 'true', NOW(), NOW()),
    ('nova_tela_de_usuarios', 'boolean', 'true', NOW(), NOW()),
    ('nova_tela_usuarios', 'boolean', 'true', NOW(), NOW()),
    ('new_facelift_pages_beta_test', 'boolean', 'true', NOW(), NOW()),
    ('nova_tela_modo_de_uso', 'boolean', 'true', NOW(), NOW()),
    ('new_learn_beta_test', 'boolean', 'true', NOW(), NOW()),
    ('new_learning_path_on_play', 'boolean', 'true', NOW(), NOW()),
    ('new_learning_path_v2', 'boolean', 'true', NOW(), NOW()),
    ('new_learning_path_v3', 'boolean', 'true', NOW(), NOW()),
    ('nova_tela_de_aprendizagem', 'boolean', 'true', NOW(), NOW()),
    ('nova_tela_de_conteudos', 'boolean', 'true', NOW(), NOW()),
    ('new_learning_path', 'boolean', 'true', NOW(), NOW()),
    ('novo_ecossistema_ambientes', 'boolean', 'true', NOW(), NOW()),
    ('nova_mensagem_de_aprovacao', 'boolean', 'true', NOW(), NOW())
	-- ('novo_ecossistema_ambientes_2', 'boolean', 'true', NOW(), NOW())

select * from flipper_features

INSERT INTO flipper_features (`key`, created_at, updated_at)
VALUES
	('super_admin_logs', NOW(), NOW()),
    ('new_partners', NOW(), NOW()),
    ('ecosystem_tnd', NOW(), NOW()),
    ('new_integrations', NOW(), NOW()),
    ('nova_tela_de_equipe', NOW(), NOW()),
    ('nova_tela_de_equipes', NOW(), NOW()),
    ('access_twygo_academy', NOW(), NOW()),
    ('mobile_admin_access', NOW(), NOW()),
    ('pagseguro', NOW(), NOW()),
    ('nova_tela_de_questionarios', NOW(), NOW()),
    ('nova_tela_de_questionario', NOW(), NOW()),
    ('user_logs', NOW(), NOW()),
    ('login_logout_logs', NOW(), NOW()),
    ('community_logs', NOW(), NOW()),
    ('new_api_v2', NOW(), NOW()),
    ('access_ted_circle', NOW(), NOW()),
    ('new_enrollment_package_registrations', NOW(), NOW()),
    ('orgs_with_games', NOW(), NOW()),
    ('allow_copy_trial_organization', NOW(), NOW()),
    ('beta_tester', NOW(), NOW()),
    ('professional_score_new_page', NOW(), NOW()),
    ('chat_hubspot', NOW(), NOW()),
    ('hubspot_events', NOW(), NOW()),
    ('jivo_chat_hubspot', NOW(), NOW()),
    ('disable_recaptcha', NOW(), NOW()),
    ('assistive', NOW(), NOW()),
    ('nova_geracao_certificado', NOW(), NOW()),
    ('novo_ecossistema_ambiente', NOW(), NOW()),
    ('nova_tela_de_usuarios', NOW(), NOW()),
    ('nova_tela_usuarios', NOW(), NOW()),
    ('new_facelift_pages_beta_test', NOW(), NOW()),
    ('nova_tela_modo_de_uso', NOW(), NOW()),
    ('new_learn_beta_test', NOW(), NOW()),
    ('new_learning_path_on_play', NOW(), NOW()),
    ('new_learning_path_v2', NOW(), NOW()),
    ('new_learning_path_v3', NOW(), NOW()),
    ('nova_tela_de_aprendizagem', NOW(), NOW()),
    ('nova_tela_de_conteudos', NOW(), NOW()),
    ('new_learning_path', NOW(), NOW()),
    ('novo_ecossistema_ambientes', NOW(), NOW()),
    ('nova_mensagem_de_aprovacao', NOW(), NOW())
--     ('novo_ecossistema_ambientes_2', NOW(), NOW())
    
    
select * from event_participants
    
SELECT
	`event_participants`.`id`,
	`event_participants`.`user_id`,
	`event_participants`.`event_id`,
	`event_participants`.`first_name`,
	`event_participants`.`last_name`,
	CONCAT(event_participants.first_name, ' ', event_participants.last_name) as full_name,
	event_participants.email as user_email,
	event_participants.cpf as user_cpf,
	`event_participants`.`progress_score`,
	CASE
		WHEN events.kind = 3 THEN (
		SELECT
			COALESCE(AVG(ep_child.final_score), 0)
		FROM
			event_participants ep_child
		INNER JOIN events e_child ON
			e_child.id = ep_child.event_id
		INNER JOIN learning_path_activities lpa ON
			lpa.event_id = e_child.id
		WHERE
			lpa.learning_path_id = event_participants.event_id
			AND ep_child.user_id = event_participants.user_id)
		ELSE event_participants.final_score
	END AS final_score,
	CASE
		WHEN events.kind = 3 THEN (
		SELECT
			COALESCE(SUM(ep_child.total_score_by_weight), 0)
		FROM
			event_participants ep_child
		INNER JOIN events e_child ON
			e_child.id = ep_child.event_id
		INNER JOIN learning_path_activities lpa ON
			lpa.event_id = e_child.id
		WHERE
			lpa.learning_path_id = event_participants.event_id
			AND ep_child.user_id = event_participants.user_id)
		ELSE event_participants.total_score_by_weight
	END AS total_score_by_weight,
	`event_participants`.`approved_at`,
	`event_participants`.`deleted_at`,
	`event_participants`.`created_by_id`,
	events.enable_certificate_generation as enable_certificate_generation,
	`event_participants`.`organization_id`,
	`event_participants`.`created_at`,
	latest_certificates.id AS certificate_id,
	latest_certificates.situation AS certificate_situation,
	latest_certificates.expires_at AS certificate_expires_at,
	latest_certificates.deleted_at AS certificate_deleted_at,
	CASE
		WHEN EXISTS (
		SELECT
			1
		FROM
			organization_relations
		WHERE
			organization_relations.organization_id = 10
			AND organization_relations.partner_id = event_participants.organization_id)
		OR event_participants.organization_id = 10 THEN 0
		ELSE 1
	END as consumer_type,
	`event_participants`.`status`,
	professionals.id as professional_id
FROM
	`event_participants`
INNER JOIN `professionals` ON
	`professionals`.`user_id` = `event_participants`.`user_id`
LEFT JOIN (
	SELECT
		id,
		event_participant_id,
		situation,
		expires_at,
		deleted_at,
		issue_at
	FROM
		certificates c1
	WHERE
		deleted_at IS NULL
		AND 
          id = (
		SELECT
			MAX(c2.id)
		FROM
			certificates c2
		WHERE
			c2.event_participant_id = c1.event_participant_id
			AND c2.deleted_at IS NULL
	    	  )
      ) latest_certificates
      ON
	latest_certificates.event_participant_id = event_participants.id
INNER JOIN `events` ON
	`events`.`deleted_at` IS NULL
	AND `events`.`id` = `event_participants`.`event_id`
WHERE
	`event_participants`.`event_id` = 75
	AND (event_participants.event_id IN ('75'))
GROUP BY
	`event_participants`.`id`
ORDER BY
	id desc
LIMIT 25 OFFSET 0

SELECT
	DISTINCT events.id,
	events.name,
	events.kind,
	events.date_time_start,
	events.date_time_end,
	events.publication_date,
	events.created_at,
	events.original_event_id,
	originals.name as original_name,
	categories.name as category_name,
	COALESCE(
        (
          SELECT event_participants.status
          FROM event_participants
          WHERE event_participants.event_id = events.id
          AND event_participants.user_id = 2),
          7
        ) AS participant_status
FROM
	events
INNER JOIN events_organizations ON
	events_organizations.event_id = events.id
LEFT OUTER JOIN categories_events ON
	categories_events.event_id = events.id
LEFT OUTER JOIN categories ON
	categories.id = categories_events.category_id
LEFT OUTER JOIN event_participants ON
	event_participants.deleted_at IS NULL
	AND event_participants.event_id = events.id
LEFT JOIN events originals ON
	originals.id = events.original_event_id
LEFT JOIN package_events ON
	package_events.event_id = events.id
WHERE
	events.deleted_at IS NULL
	AND events_organizations.organization_id = 8
	AND events_organizations.association_type = 0
	AND (events.situation = '1')
	AND events.kind IN (0, 3, 4)
	AND (1 = 1)
	AND (1 = 1)
	AND (1 = 1)
	AND (events.inscription_access IN (3, 2)
		OR (event_participants.user_id = 2))
	AND (1 = 1)
HAVING
	((events.name LIKE '%paco%'
		OR original_name LIKE '%paco%')
	OR categories.name LIKE '%paco%')
ORDER BY
	CASE
		WHEN participant_status <> 2
		OR participant_status IS NULL THEN 0
		ELSE 1
	END,
	CASE
		WHEN events.name = 'paco' THEN 0
		ELSE 1
	END,
	events.created_at DESC
LIMIT 25 OFFSET 0


SELECT
	events.id,
	events.name,
	events.kind,
	events.date_time_start,
	events.date_time_end,
	events.publication_date,
	events.created_at,
	events.original_event_id,
	originals.name as original_name,
	GROUP_CONCAT(DISTINCT categories.name SEPARATOR ', ') as category_name, -- Aggregate categories
	COALESCE(
        (
          SELECT event_participants.status
          FROM event_participants
          WHERE event_participants.event_id = events.id
          AND event_participants.user_id = 2
          LIMIT 1
        ),
        7
    ) AS participant_status
FROM
	events
INNER JOIN events_organizations ON
	events_organizations.event_id = events.id
LEFT OUTER JOIN categories_events ON
	categories_events.event_id = events.id
LEFT OUTER JOIN categories ON
	categories.id = categories_events.category_id
LEFT JOIN events originals ON
	originals.id = events.original_event_id
LEFT JOIN package_events ON
	package_events.event_id = events.id
WHERE
	events.deleted_at IS NULL
	AND events_organizations.organization_id = 8
	AND events_organizations.association_type = 0
	AND events.situation = '1'
	AND events.kind IN (0, 3, 4)
	AND (events.inscription_access IN (3, 2)
		OR EXISTS (
			SELECT 1 FROM event_participants 
			WHERE event_participants.event_id = events.id 
			AND event_participants.user_id = 2
		)
	)
HAVING
	(events.name LIKE '%paco%'
		OR original_name LIKE '%paco%'
		OR category_name LIKE '%paco%')
GROUP BY events.id
ORDER BY
	CASE
		WHEN participant_status <> 2
		OR participant_status IS NULL THEN 0
		ELSE 1
	END,
	CASE
		WHEN events.name = 'paco' THEN 0
		ELSE 1
	END,
	events.created_at DESC
LIMIT 25 OFFSET 0;
