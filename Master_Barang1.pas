{File : Aplikasi_Master_Barang.pas}
{Desc : Aplikasi ini merupakan bagian aplikasi online shop yang merupakan pengaturan barang.}
{Date : 23 March 2016}

program AppMasterBarang;

uses crt;

type
     tpengaturan  = record        {Untuk setting penomoran pada type admin}
     adds2        : integer;      //Seusadah Login
     adds5        : integer;      //inputan

end;

type
     tbarang       = record       //type untuk memasukkan inputan.
     id        	   : longint;      //id barang
     nama      	   : string;	  //nama barang
     harga	   : longint;	  //harga barang
     stok	   : integer;	  //stok barang
end;


type
     tlogin        = record
     username      : string;
     password      : string;

end;


var
  barang                : array[1..100] of tbarang;
  admin                 : array [1..3] of tlogin;
  adds                  : tpengaturan;
  menu                  : string;
  i		        : integer;

  procedure pidsama;                                      forward;
  procedure ploading;                                     forward;
  procedure pheader;                                      forward;
	Procedure selectionsort ;    forward;
	procedure pheaderlogin;                                 forward;
  procedure plogin;                                       forward;
  function  flogin(a,b:string):boolean;                   forward;
  procedure psalahlogin;                                  forward;
  procedure pheaderinput;                                 forward;
  function finput:string;	forward;
  procedure pinput;                                       forward;
  procedure pbatalinput(a:string);                      forward;
  procedure ppilihanbatalinput;                           forward;
  procedure pberhasilinput;                               forward;
  procedure psalahid;					  forward;
  procedure tampil;                                       forward;
  procedure pmenuadmin;					  forward;
  procedure daftarbarang;                                 forward;
  procedure pheadercari;                                  forward;
  procedure pcari;                                        forward;
  function fcari(a:integer):integer;			  forward;

  procedure pheaderubah;				  forward;
  function fubah:string;				  forward;
  procedure pubah;					  forward;

  procedure ppilihanbatalubah;				  forward;
  procedure pberhasilubah;				  forward;
  procedure pidsalah;	forward;
  procedure perror;                                       forward;
  procedure pkeluar;                                      forward;


  procedure ploading;
  begin
          clrscr;

          gotoxy(50,11); writeln('LOADING');
          gotoxy(50,12); delay(0); write('* ');
                         delay(500); write('* ');
                         delay(500); write('* ');
                         delay(500); write('* ');

     end;

  procedure pheader;
  begin
          clrscr;

          gotoxy(33,10); writeln('===========================================================');
          gotoxy(33,11); writeln('=                Aplikasi Master Barang                   =');
          gotoxy(33,12); writeln('= Silahkan mengikuti ketentuan yang berlaku, terima kasih =');
          gotoxy(33,13); writeln('=     Silahkan tekan tombol sembarang untuk memulai       =');
          gotoxy(33,14); writeln('===========================================================');

          readkey;
          ploading;
          plogin;
     end;

	Procedure selectionsort ;
var
        m,n,min : integer;
        tmp: tbarang;
begin
        for m:=(length(barang)-1) downto 1  do
        begin
                min:= m;
                for n:=m+1 to length(barang) do
                        if(barang[n].id < barang[min].id) then
                                min:=n;
                                tmp:=barang[min];
                                barang[min]:=barang[m];
                                barang[m]:=tmp;
        end;
		
end;

		
procedure pheaderinput;
  begin
          clrscr;

          gotoxy(15,3);  writeln('Silahkan isi form berikut : ');
          gotoxy(15,6);  write('ID Barang   : ____________________');
          gotoxy(15,8);  write('Nama Barang : ____________________');
          gotoxy(15,10); write('Harga Barang: ____________________');
	  gotoxy(15,12); write('Stok Barang : ____________________');
          gotoxy(15,15); writeln('1.save        2.Batal  ');
          gotoxy(15,18); write('>>>>> ');
     end;
	


  function finput:string;
  var
	cari:integer;
	a:integer;
     begin
			
          pheaderinput;
		  gotoxy(15,3);  writeln('Silahkan isi form berikut : ');
          gotoxy(15,6);  write('ID Barang   : '); readln(cari);
		  	
			a:=fcari(cari);
			
			if a =0 then
			 begin
			 barang[adds.adds5].id:=cari;
	  gotoxy(15,8);  write('Nama Barang : '); readln(barang[adds.adds5].nama);
          gotoxy(15,10); write('Harga Barang: '); readln(barang[adds.adds5].harga);
	  gotoxy(15,12); write('Stok Barang : '); readln(barang[adds.adds5].stok);
	
	      gotoxy(15,15); writeln('1.save        2.Batal  ');
          gotoxy(15,18); write('>>>>> '); readln(menu);
          finput:=menu;
		end
		else
			pidsama;
			
						
		
      end;

  procedure pinput;
  var
          a:string;
  begin

          a:=finput;
          case a of
          '1': begin
					adds.adds5:=adds.adds5+1;
					pberhasilinput;
					tampil;
	end;
		


          '2': begin
                    ppilihanbatalinput;
					
                    write('>>>>> '); readln(menu);
                    pbatalinput(menu);

               end;
	
          else
               perror;
			   barang[adds.adds5].id:=0;
			
			
          end;
     end;

  procedure pbatalinput(a:string);
  begin
          case a of
          '1': begin
				barang[adds.adds5].id:=0;
				tampil;
			
			end;
          '2': begin
		  barang[adds.adds5].id:=0;
		  pinput;
				
				end;
          else
               perror;
			
          end;
     end;

  procedure ppilihanbatalinput;
  begin
          clrscr;
          gotoxy(33,12);writeln('Apakah anda yakin ingin membatalkan menginput');
          gotoxy(33,13);writeln('1. yes 2.no');
          gotoxy(33,15);write('>>>>> ');
  end;

  procedure pberhasilinput;
  begin
          clrscr;

          gotoxy(33,10); write('=====================================================');
          gotoxy(33,11); write('=            Data Barang Berhasil Tersimpan         =');
	  gotoxy(33,12); write    ('=   Silahkan tekan tombol sembarang untuk ke Home   =');
          gotoxy(33,13); write('=====================================================');
	  readkey;
   end;

    procedure pidsama;
  begin
          clrscr;

          gotoxy(33,11);writeln('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
          gotoxy(33,12);writeln('=    Maaf ID yang ada masukan sudah digunakan     !!');
          gotoxy(33,13);writeln('=    Silahkan Pilih Menu yang anda inginkan       !!');
          gotoxy(33,14);writeln('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
          gotoxy(5,16); writeln('1.Home       2. Input Barang    3. Cari Barang    4.Update data    5. Log Out    0.Exit');
		  gotoxy(5,18); write('>>>>> ');readln(menu);
		  pmenuadmin;
			
  end;


  procedure pheaderubah;

     begin
          clrscr;

	  gotoxy(15,2);  write('Pilih ID Barang yang ingin di ubah : ');
	
          gotoxy(15,9);  write('Silahkan isi Update Data baru  : ');
          gotoxy(15,11);  write('Nama Barang :_________________');
          gotoxy(15,13); write('Harga Barang:_________________');
	  gotoxy(15,15); write('Stok Barang :_________________');
          gotoxy(15,17); writeln('1. Save  ');
          gotoxy(15,19); write('>>>>> ');

     end;

  function fubah:string;
     var
		i,cari,x,y:integer;

     begin

          i:=0;
          pheaderubah;
	  gotoxy(15,2);  write('Pilih ID Barang yang ingin di ubah : ');readln(cari);
	  i:=fcari(cari);
          if (i<>0) then
          begin
	    gotoxy(15,4); write(' Apakah anda yakin untuk mengubahnya? ');
	     gotoxy(15,5);write('          1.ya      2.tidak       ');
	     gotoxy(15,7);write('>>>>> ');readln(menu);
		 case menu of
		  '1': begin
					gotoxy(15,9);  write('Silahkan isi Update Data baru  : ');
	                gotoxy(15,11);  write('Nama Barang : '); readln(barang[i].nama);
                        gotoxy(15,13); write('Harga Barang: '); readln(barang[i].harga);
	                gotoxy(15,15); write('Stok Barang : '); readln(barang[i].stok);
                        gotoxy(15,17); writeln('1. Save         ');
                        gotoxy(15,19); write('>>>>> '); readln(menu);
                        fubah:=menu;
				end;
				'2': begin  tampil; end;
	
	  else
	  perror;
	  end;
	  end

	  else
	  pidsalah;
	
	
     end;


  procedure pubah;
  var
          a:string;
  begin

          a:=fubah;
          case a of
          '1': begin
                    pberhasilubah;

               end;

		
			
          else
               perror;
			   pkeluar;
          end;
     end;


  procedure ppilihanbatalubah;
  begin
          clrscr;
          gotoxy(33,12);writeln('Apakah anda yakin ingin Keluar dari Menu Pengubahan');
          gotoxy(33,13);writeln('                   1. yes 2.no');

     end;

  procedure pberhasilubah;
  begin
          clrscr;

          gotoxy(33,11); write('=============================================');
          gotoxy(33,12); write('=      Perubahan Berhasil di Simpan         =');
	  gotoxy(33,13); write('=   Silahkan Pilih menu yang diiginkan      =');
          gotoxy(33,14); write('=============================================');
	  gotoxy(5,17); writeln('1.Home       2. Input Barang    3. Cari Barang    4.Update data    5. Log Out    0.Exit');
          gotoxy(30,19);write('>>>>> '); readln(menu);
          pmenuadmin;


     end;
	
procedure pidsalah;
  begin
          clrscr;

          gotoxy(33,11);writeln('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
          gotoxy(33,12);writeln('= Maaf ID yang ada masukan tidak dapat di temukan !!');
          gotoxy(33,13);writeln('=         Silahkan tunggu beberapa saat           !!');
          gotoxy(33,14);writeln('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
          delay(1000);
		  fubah;
		
  end;

	

  procedure pheaderlogin;
  begin
          clrscr;

          gotoxy(15,2); writeln('Menu Login');
          gotoxy(15,5); write('Username : __________________');
          gotoxy(15,6); write('Password : __________________');
          gotoxy(15,10);writeln('1. Login      2. Clear     0. Exit  ');
          gotoxy(15,15);write('>>>>> ');

     end;

     procedure plogin;
     var
          username,password:string;
          a:boolean;
     begin
          a:=false;
          while (a<>True) and (menu<>'0') do
          begin
               pheaderlogin;
               gotoxy(15,5);  write('Username : '); readln(username);
               gotoxy(15,6);  write('Password : '); readln(password);
               gotoxy(15,15); write('>>>>> ');      readln(menu);
               case menu of
               '1': begin
                        a:=flogin(username,password);
                        if (a=True) then
                             begin
                                  ploading;
				  tampil;

                             end
                        else
                             psalahlogin;
                             plogin;
                    end;
               '2': begin
                         plogin;
                    end;
               '0': begin
                         pkeluar;
                    end;
               else
                    perror;
					plogin;
              end;
          end;
     end;

  function flogin(a,b:string):boolean;
  var
          c:integer;
  begin
          flogin:=false;
          for c:=1 to length(admin) do
          begin
               if (a=admin[c].username) and (b=admin[c].password) then
               begin
                    adds.adds2:=c;
                    flogin:=True;
               end;

          end;
    end;

  procedure psalahlogin;
  begin

			clrscr;
          gotoxy(33,11);writeln('=============================================');
          gotoxy(33,12);writeln('=  Maaf Username atau Password anda salah   =');
          gotoxy(33,13);writeln('= Tekan tombol sembarang pada keyboard anda =');
          gotoxy(33,14);writeln('=      untuk kembali ke menu semula         =');
          gotoxy(33,15);writeln('=============================================');
          readkey;
  end;





procedure tampil;

  begin
          clrscr;

	  gotoxy(35,1); writeln('=============================================');
	  gotoxy(35,2); writeln('=  Selamat Datang di Aplikasi Master Barang =');
          gotoxy(35,3); writeln('=============================================');
	  gotoxy(5,5); writeln('Menu Program : ');
          gotoxy(5,7); writeln('1.Home       2. Input Barang    3. Cari Barang    4.Update data    5. Log Out    0.Exit');
          gotoxy(40,12); writeln('Data Barang');
			
		   for i:=1 to 100 do
		
                  begin
selectionsort;
                  if barang[i].id<>0 then
				
		  begin
			
				write('ID Barang: ',barang[i].id,' | ');
               write('Nama Barang: ',barang[i].nama,'  | ');
               write('Harga Barang: ',barang[i].harga,' | ');
               writeln('Stok barang: ',barang[i].stok);
			   writeln;

			   end;
			
		  end;
          gotoxy(5,9);write('>>>>> '); readln(menu);
          pmenuadmin;

     end;

  procedure pmenuadmin;
  begin

    case menu of
        '1':  begin tampil; end;
        '2':  begin pinput; end;
	'3':  begin pheadercari; end;
	'4':  begin pubah; end;
	'5':  begin plogin; end;

	'0': begin  pkeluar;
	end;
    	else
		perror;
        end;
   end;

  procedure daftarbarang;
  var
	i:integer;
  begin
        for i:=1 to 5 do
        begin
            barang[i].id:=13011+i;
            barang[i].harga:=50000*i;
            barang[i].stok:=5*i;
        end;
            barang[1].nama:='Tas';
            barang[2].nama:='Mouse';
            barang[3].nama:='Hp';
            barang[4].nama:='Hardisk';
            barang[5].nama:='Netbook';
  end;


  procedure pheadercari;
  begin
          clrscr;

          gotoxy(15,3); writeln('Menu Pencarian Barang');
          gotoxy(15,5); write('Masukan ID Barang yang ingin Di cari :...........');
          gotoxy(15,7); write('1. Search        2.Home');
          gotoxy(15,8); write('        3.clear');
		  gotoxy(15,9);write('>>>>> ');
		  pcari;

  end;


  procedure pcari;
  var
        a,cari:integer;
  begin


               gotoxy(15,3); writeln('Menu Pencarian Barang');
               gotoxy(15,5); write('Masukan ID Barang yang ingin Di cari : ');readln(cari);
	       gotoxy(15,7); write('1. Search        2.Home');
	       gotoxy(15,8); write('        3.clear');
               gotoxy(15,9); write('>>>>> ');      readln(menu);
               case menu of
               '1': begin
                        a:=fcari(cari);
                        if (a<>0) then
                             begin
                                gotoxy(5,12);writeln('Hasil Pencarian');
                                writeln;
                                gotoxy(5,14); writeln('ID Barang   Nama Barang   Harga Barang   stok Barang');
                                gotoxy(5,15);write(barang[a].id);
                                gotoxy(17,15);write(barang[a].nama);
                                gotoxy(31,15);write(barang[a].harga);
                                gotoxy(46,15);write(barang[a].stok);
			        gotoxy(15,9);write('>>>>> '); readln(menu);
				if (menu='2') then
				       tampil;
					
                             end
                        else
                             psalahid;
							 pheadercari;

                    end;
               '2': begin
                         tampil
                    end;
		'3': begin
                         pheadercari;
		     end;
               else
                    perror;

              end;

  end;






  function fcari(a:integer):integer;
  var
          c:integer;
  begin
          fcari:=0;
          for c:=1 to length(barang) do
          begin
               if (a=barang[c].id) then
               begin
                    adds.adds5:=c;
                    fcari:=c;


               end;

          end;
  end;

   procedure psalahid;
  begin
          clrscr;

          gotoxy(33,11);writeln('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
          gotoxy(33,12);writeln('= Maaf ID yang ada masukan tidak dapat di temukan !!');
          gotoxy(33,13);writeln('=         Silahkan klik tombol sembarang          !!');
          gotoxy(33,14);writeln('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
          readkey;
		
  end;


  procedure perror;
  begin
          clrscr;
          gotoxy(33,10); writeln('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
          gotoxy(33,11); writeln('!  Maaf Sistem error anda tidak memasukkan sesuai ketentuan  !');
          gotoxy(33,12); writeln('!       Silahkan Tekan tombol sembarang pada keyboard        !');
          gotoxy(33,13); writeln('!               untuk kembali ke menu semula                 !');
          gotoxy(33,14); writeln('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
          readkey;
  end;

  procedure pkeluar;
  begin
          clrscr;
          gotoxy(33,10); writeln('===========================================================');
          gotoxy(33,11); writeln('=  Terima Kasih Sudah menggunakan Program Master Barang   =');
          gotoxy(33,12); writeln('=       Semoga Hari mu menyenangkan, :Da...dah....        =');
          gotoxy(33,13); writeln('===========================================================');
          delay(2000); exit;
  end;

begin
	clrscr;
	adds.adds5:=6;

     daftarbarang;
	
     admin[1].username:='admin';
     admin[1].password:='admin';
     admin[2].username:='13011andy';
     admin[2].password:='54179tama';
     admin[3].username:='tamtama';
     admin[3].username:='andynata';
	
     pheader;
	
end.
