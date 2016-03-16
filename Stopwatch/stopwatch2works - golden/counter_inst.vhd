counter_inst : counter PORT MAP (
		aset	 => aset_sig,
		clock	 => clock_sig,
		cnt_en	 => cnt_en_sig,
		sclr	 => sclr_sig,
		q	 => q_sig
	);
