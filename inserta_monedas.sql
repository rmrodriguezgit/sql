call bd_casabolsa.sp_inserta_divisa('USD', 'Dolar Americano');
call bd_casabolsa.sp_inserta_divisa('EUR', 'Euro');
call bd_casabolsa.sp_inserta_divisa('JPY', 'Yen Japonés');
call bd_casabolsa.sp_inserta_divisa('GBP', 'Libra Esterlina');
call bd_casabolsa.sp_inserta_divisa('CNY', 'Yuan Chino');

call bd_casabolsa.sp_actualiza_divisa( 'USD', 20.40);
call bd_casabolsa.sp_actualiza_divisa('EUR', 21.53);
call bd_casabolsa.sp_actualiza_divisa( 'JPY', 0.16);
call bd_casabolsa.sp_actualiza_divisa( 'CNY', 3.07);
call bd_casabolsa.sp_actualiza_divisa( 'GBP', 25.65);

call bd_casabolsa.reserva_inicial( 'USD', 150000);

call bd_casabolsa.sp_venta_divisa('USD', 100000, '1');