
sub run_fun{
	my($fun_name2, $params) = @_;
	my $fun_name = \&{$fun_name2};
	&$fun_name($params);
	
}
sub hello{
	my ( $name ) = @_;
	print "Hello, $name!";
}
sub buy{
	my ( $name ) = @_;

	print "Buy, $name!";

}
run_fun("buy", "Denis");
