my @route_table = (
	["catalog", "s_catalog", "v_name"],
	["book", "s_book", "v_isbn"],
	["book", "s_book", "v_isbn", "v_isbn"],
);

sub route_exec{
	my ($url) = @_;
	my $error;
	my $name_func_to_run;
	my @params_to_func;
	my @array_path = split /\//, $url;
	my $array_path_size = @array_path;
	
	my $route_table_size = @route_table;

	for (my $i = 0; $i < $route_table_size; $i++){
		$error = 0;
		@params_to_func = ();
		my $route_link = $route_table[$i];
		my @tmp_array = @$route_link;
		

		my $route_size = @tmp_array;

		if($route_size == $array_path_size){
			
			for (my $j = 1; $j < $route_size; $j++) {

				my $prefix = substr($tmp_array[$j], 0, 2);
				
				my $route_param = $tmp_array[$j];
				substr($route_param, 0, 2) = "";				

				if($prefix eq "s_"){
					if($route_param ne $array_path[$j]){
						$error = 1;
						last;
					}
				}
				else{
					push(@params_to_func, $array_path[$j]);
				}
			}

			if(!$error){
				$name_func_to_run = $tmp_array[0];
				last;
			}
		}
	}

	if (!$error) {
		#run_fun($name_func_to_run, @params_to_func);
		print "$name_func_to_run \n";
	}
	else{
		return 0;
	}
}

route_exec("/book/adawdaw/adawdawd/");
