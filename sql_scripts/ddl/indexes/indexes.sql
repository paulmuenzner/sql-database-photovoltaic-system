-- Drop indexes
DROP INDEX IF EXISTS log_status_pv_system_minutes__pv_system_id ON log_status_pv_system_minutes;

DROP INDEX IF EXISTS used_inverter__pv_system_id ON used_inverter;

DROP INDEX IF EXISTS used_inverter__inverter_id ON used_inverter;

DROP INDEX IF EXISTS used_charge_controller__panel_array_id ON used_charge_controller;

DROP INDEX IF EXISTS used_charge_controller__charge_controller_id ON used_charge_controller;

DROP INDEX IF EXISTS battery__pv_system_id ON battery;

DROP INDEX IF EXISTS panel_usage__panel_array_id ON panel_usage;

DROP INDEX IF EXISTS panel_usage__panel_product_id ON panel_usage;

DROP INDEX IF EXISTS panel_arrays__pv_system_id ON panel_arrays;

DROP INDEX IF EXISTS used_pv_combiner_box__panel_array_id ON used_pv_combiner_box;

DROP INDEX IF EXISTS used_pv_combiner_box__pv_combiner_box_id ON used_pv_combiner_box;

-- Create indexes
CREATE INDEX log_status_pv_system_minutes__pv_system_id ON log_status_pv_system_minutes (pv_system_id);

CREATE INDEX used_inverter__pv_system_id ON used_inverter (pv_system_id);

CREATE INDEX used_inverter__inverter_id ON used_inverter (inverter_id);

CREATE INDEX used_charge_controller__panel_array_id ON used_charge_controller (panel_array_id);

CREATE INDEX used_charge_controller__charge_controller_id ON used_charge_controller (charge_controller_id);

CREATE INDEX battery__pv_system_id ON battery (pv_system_id);

CREATE INDEX panel_usage__panel_array_id ON panel_usage (panel_array_id);

CREATE INDEX panel_usage__panel_product_id ON panel_usage (panel_product_id);

CREATE INDEX panel_arrays__pv_system_id ON panel_arrays (pv_system_id);

CREATE INDEX used_pv_combiner_box__panel_array_id ON used_pv_combiner_box (panel_array_id);

CREATE INDEX used_pv_combiner_box__pv_combiner_box_id ON used_pv_combiner_box (pv_combiner_box_id);