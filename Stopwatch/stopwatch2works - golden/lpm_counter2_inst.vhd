lpm_counter2_inst : lpm_counter2 PORT MAP (
		clk_en	 => clk_en_sig,
		clock	 => clock_sig,
		cnt_en	 => cnt_en_sig,
		sclr	 => sclr_sig,
		q	 => q_sig
	);
