-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 16 Nov 2020 pada 08.51
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kesehatan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_berita`
--

CREATE TABLE `tb_berita` (
  `id_berita` int(11) NOT NULL,
  `judul` varchar(125) NOT NULL,
  `isi` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `tgl_berita` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_berita`
--

INSERT INTO `tb_berita` (`id_berita`, `judul`, `isi`, `foto`, `tgl_berita`) VALUES
(1, '3 Nakes Rusia Terinfeksi COVID-19 Meski Sudah Vaksinasi, Sputnik V Tak Bikin Kebal?', 'Tiga kasus infeksi COVID-19 kembali dilaporkan kemarin Selasa (10/11/2020) di wilayah Altai, Siberia, Rusia. Petugas medis di wilayah Altai yang divaksinasi beberapa minggu lalu dengan Sputnik V, vaksin COVID-19 buatan Rusia, dilaporkan positif terinfeksi COVID-19.\r\nSebanyak 42 petugas medis telah divaksinasi oleh vaksin produksi lembaga penelitian Gamaleya yang berbasis di Moskow pada akhir September lalu dengan kepala ahli epidemiologi regional, Irina Pereladova yang menjadi orang pertama yang mendapat vaksinasi.\r\n\r\nMenurut protokol Sputnik V, dosis kedua disuntikkan pada 14 Oktober lalu. Sehari sebelum vaksinasi dilakukan kepada petugas medis melakukan tes COVID-19 dan semuanya menunjukkan hasil negatif.', 'berita1.jpg', '2020-11-02 21:28:47'),
(2, 'Efek Samping Vaksin COVID-19 Pfizer Vs Sinovac, Ini Perbandingannya', 'Pencarian vaksin COVID-19 masih terus dikebut. Salah satunya yang dinilai cukup menjanjikan adalah kandidat vaksin buatan perusahaan farmasi Pfizer dan BioNTech yang diklaim 90 persen efektif.\r\nSeperti halnya vaksin lainnya, vaksin virus Corona sampai saat ini masih terus diteliti terkait efektivitasnya dan juga efek samping. Ini untuk mengetahui apakah ada efek samping yang muncul setelah diberikan suntikan vaksin tersebut.\r\n\r\nBerikut beberapa vaksin COVID-19 yang sampai saat ini telah melaporkan adanya efek samping ringan pada relawannya, setelah disuntikkan.\r\n1. BNT162b2 buatan Pfizer\r\nBerdasarkan keterangan para relawan yang mendapatkan suntikan pertama vaksin BNT162b2 yang dikembangkan Pfizer dan BioNTech, ada beberapa efek samping yang muncul. Beberapa dari 43.500 relawan merasakan efek samping seperti sakit kepala dan nyeri otot, seperti yang muncul setelah melakukan vaksin flu.\r\n\r\nDua relawan yang diketahui bernama Glenn Deshields (44) dari Austin, Texas dan Carrie (45) dari Missouri juga mengalaminya. Glenn merasakan \'pengar yang parah\' dan rasa seperti mabuk, tapi efek samping tersebut menghilang dengan cepat.\r\n\r\nSementara Carrie mengatakan dirinya merasakan efek samping berupa sakit kepala, nyeri di tubuh, hingga demam. Carrie mengaku mulai merasakannya setelah mendapat suntikan pertamanya pada bulan September lalu.\r\n\r\n\"Efek sampingnya tampak meningkat setelah dosis kedua bulan lalu,\" jelasnya yang dikutip dari Express UK, Rabu (11/11/2020).\r\n\r\nSaat pemberian vaksin ini, para relawan tidak mengetahui apakah mereka menerima plasebo atau vaksin. Tapi, Carrie yakin efek samping ini ia rasakan setelah penyuntikkan.\r\n\r\n2. CoronaVac buatan Sinovac\r\nDikutip dari Reuters, vaksin CoronaVac juga dilaporkan menyebabkan efek samping ringan pada relawannya. Sejauh ini, vaksin yang dikembangkan Sinovac tersebut diklaim aman berdasarkan data awal uji klinis tahap akhir di Brasil.\r\n\r\nTetapi, direktur Butantan Dimas Covas mengatakan data tentang seberapa efektif vaksin itu tidak akan dirilis sampai uji coba selesai pada 13.000 sukarelawan.\r\n\r\nMeski begitu, Covas mengatakan vaksin ini tidak memberikan efek samping yang parah.\r\n\r\nCovas menjelaskan sekitar 20 persen relawan mengalami nyeri ringan akibat suntikan. Sementara 15 persen melaporkan merasakan sakit kepala setelah pemberian dosis pertama, tapi turun menjadi 10 persen untuk dosis kedua. Sementara sebanyak 5 persen relawan melaporkan merasa mual, kelelahan, bahkan nyeri otot.\r\n\r\n', 'berita2.jpeg', '2020-11-09 10:24:43'),
(3, 'Segini Harga Vaksin COVID-19 Buatan Luar Negeri, Mana yang Paling Murah?', 'Saat pengembangan vaksin COVID-19 mendekati putaran terakhir dengan beberapa uji coba fase 3 yang sedang berlangsung, banyak yang bertanya-tanya berapa kira-kira kisaran harga vaksin yang akan dijual di pasaran?\r\nHingga saat ini, belum ada keterangan resmi terkait harganya sebab vaksin masih dalam tahap penelitian. Namun beberapa sumber resmi sempat menyebut kisaran harga vaksin per dosis.\r\nUntuk vaksin COVID-19 Sinovac yang saat ini tengah dilakukan uji klinis fase 3 di Bandung, PT Bio Farma beberapa kali menyinggung harga yang dibandrol untuk satu dosisnya adalah sekitar Rp 200 ribu. Dalam penyusunan harga vaksin COVID-19, pihak PT Bio Farma mengatakan ada beberapa elemen yang harus diperhitungkan selain harga bahan baku dan biaya impor.\r\n\r\nPemerintah Indonesia disebut mempertimbangkan pengadaan vaksin COVID-19 yang dikembangkan Pfizer yang diklaim 90 persen mampu cegah infeksi Corona.\r\n\r\n\"Indonesia tentunya dari berbagai vaksin itu dipertimbangkan, tapi kami belum memasukkan Pfizer sebagai salah satu (pada saat ini),\" Menteri Koordintor Bidang Perekonomian Airlangga Hartato.', 'berita3.jpeg', '2020-11-09 10:35:01'),
(4, 'Obsesi Ingin Kurus Berujung Fatal, Nyaris Tewas akibat \'Diabulimia\'', 'Bagi sebagian orang, diet bukanlah menjadi hal yang sangat mudah untuk dilakukan. Selain harus disiplin dan konsisten, seseorang juga perlu untuk mempertimbangkan kondisi kesehatan sebelum melakukan diet.\r\nSalah satu kondisi yang perlu dipertimbangkan ketika diet adalah diabetes. Hal inilah yang dialami oleh wanita asal Inggris bernama Amber Dumbill.\r\n\r\nDikutip dari laman Daily Mail, Amber merupakan seorang penari balet yang memiliki kondisi dengan diabetes tipe 1. Hal ini menyebabkannya harus rajin melakukan suntik insulin.\r\n\r\nAmber sendiri sebenarnya tidak benar-benar gemuk. Ukuran baju terbesarnya adalah size M selama bersekolah.\r\n\r\nNamun sayangnya Amber sering kehilangan rasa percaya diri karena harus memakai baju ketat ketika menari balet. Amber pun juga kerap membandingkan tubuhnya dengan penari lain yang memiliki tubuh yang langsing.\r\nHasilnya, Amber memang berhasil turun ke ukuran S. Tanpa suntuk insulin, tubuh penderita diabetes tipe 1 memang akan membakar lemak lebih cepat.\r\n\r\nDi sisi lain, hal ini juga berdampak buruk bagi dirinya. Suatu pagi, Amber tidak bisa bangun dari tempat tidur dan muntah darah. Ketika ia dicek, gula darahnya sudah naik dengan pesat. Bibirnya pun juga membiru dan paramedis mengatakan bahwa gadis tersebut terancam kehilangan nyawa.\r\n', 'berita4.jpeg', '2020-11-11 13:59:25'),
(5, 'Kematian Relawan Vaksin COVID-19 Sinovac di Brasil Disebut Bunuh Diri', 'Otoritas kesehatan Brasil, Anvisa, saat ini dilaporkan menangguhkan uji klinis vaksin COVID-19 Sinovac di San Paulo, Brasil. Alasan pemberhentian disebut adanya dugaan efek samping serius yang ditimbulkan vaksin COVID-19 buatan China tersebut.\r\nDikutip dari Reuters, pemerintah San Paulo, tempat uji klinis dilakukan, menyebut kematian relawan vaksin Sinovac merupakan kasus bunuh diri dan saat ini tengah diselidiki. Laporan polisi tentang insiden itu dilihat langsung oleh Reuters.\r\n\r\nPenangguhan tersebut semakin meningkatkan ketegangan antara Presiden Brasil Jail Bolsonaro dan Gubernur San Paulo Joao Doria, yang telah menggantungkan ambisi politiknya pada vaksin China yang ia rencanakan untuk diluncurkan di negara bagiannya pada awal Januari, dengan atau tanpa bantuan federal.\r\n\r\nAnvisa mengatakan akan terus melakukan penangguhan dan tidak memberikan indikasi berapa lama itu akan berlangsung. Anvisa menegaskan keputusan tersebut tidak terkait politik namun murni masalah teknis.\r\nMenteri Kesehatan San Paulo, Jean Gorinchteyn, mengatakan kematian relawan tidak berhubungan dengan vaksin COVID-19 Sinovac.\r\n\r\n\"Kami memiliki peristiwa eksternal yang membuat regulator diberitahu. Vaksin ini aman,\"kata Gorinchteyn.\r\n\r\nMeski demikian pihak Anvisa mengatakan, informasi awal yang mereka terima tidak menyebutkan bahwa kematian relawan adalah kasus bunuh diri.\r\n\r\n\"Kami tidak punya pilihan selain menangguhkan uji klinis mengingat kejadian tersebut,\" kata kepala Anvisa, Antônio Barra Torres.', 'berita5.jpeg', '2020-11-11 14:02:09'),
(6, '5 Minuman Sehat yang Bisa Bantu Turunkan Berat Badan', 'Kelebihan berat badan tidak selalu berasal dari makanan. Terkadang, kita juga tidak memperhatikan asupan cairan yang masuk ke tubuh kita, seperti minuman manis. Saat kita mencoba program diet, tanpa disadari kalori cairan dalam tubuh akan mudah turun.\r\nDikutip dari Insider, berikut 5 minuman sehat yang dapat membantu program diet tanpa mengurangi kadar cairan tubuh:\r\n1. Air putih\r\nAir putih tidak mengandung pemanis sama sekali sehingga baik untuk kesehatan tubuh. Minum air putih sebelum makan membantu mengisi perut nol kalori sehingga asupan makan dapat lebih sedikit. Tubuh yang terhidrasi dengan baik akan menjauhkan rasa lapar.\r\n\r\n2. Air infus (infused water)\r\nMengganti minuman berkalori tinggi dengan air tidak hanya menurunkan kadar kalori setiap habis makan, tetapi juga meningkatkan pencernaan dan metabolisme tubuh. Jika bosan dengan air putih biasa, isi segelas air dengan es batu dan campuran di dalamnya, seperti irisan ketimun, irisan jeruk nipis, kemangi, dan daun mint. Minuman itu disebut dengan infused water.\r\n\r\n3. Teh hijau\r\nKandungan kafein dalam teh hijau dapat meningkatkan kemampuan tubuh untuk membakar lemak serta metabolisme dalam tubuh, contohnya teh hijau matcha. Sebuah studi menyatakan bahwa mengonsumsi teh hijau matcha sebelum olahraga jalan dapat membakar lemak lebih banyak daripada tidak mengonsumsinya sama sekali.\r\n\r\n', 'berita6.jpg', '2020-11-11 14:03:10'),
(7, '7 Sumber Nutrisi Menyehatkan Ini Malah Jadi Penyakit kalau Berlebihan', 'Makanan sehat adalah makanan yang mengandung beragam nutrisi yang diperlukan tubuh agar terhindar dari berbagai penyakit. Ada banyak pilihan makanan sehat yang baik untuk dikonsumsi.\r\nNamun, penting untuk diingat bahwa lebih banyak tidak selalu lebih baik. Beberapa makanan mungkin baik dikonsumsi dalam jumlah sedang, tetapi sangat berbahaya dalam jumlah besar.\r\n1. Brokoli\r\nBrokoli kaya akan vitamin dan nutrisi yang bermanfaat untuk meningkatkan daya tahan tubuh. Namun jika dikonsumsi berlebihan, brokoli dapat menyebabkan hipotiroidisme atau penyakit kekurangan hormon tiroid.\r\n\r\n\"Ini karena brokoli mengandung tiosianat, yang membuat tubuh Anda sulit menyerap yodium. Jika Anda pernah mengalami masalah tiroid di masa lalu, pastikan untuk tidak mengonsumsi brokoli dalam jumlah yang sangat banyak,\" ujar Ahli gizi, Lyssie Lakatos, RDN, CDN, CFT, dan Tammy Lakatos Shames, RDN, CDN, CFT, penulis dari The Nutrition Twins\' Veggie Cure.\r\n\r\n2. Air lemon\r\nBanyak ahli kesehatan yang menganjurkan untuk minum air lemon setiap pagi karena memiliki berbagai manfaat bagi tubuh. Namun konsumsi air lemon berlebihan juga dapat berdampak buruk bagi kesehatan gigi.\r\n\r\nMenurut Ahli gizi, Lyssie dan Tammy Lakatos, jika minum banyak air lemon, asam dari lemon tetap menempel di gigi dan dapat merusak enamel gigi, yang membuat gigi mudah berlubang. Mereka merekomendasikan untuk berkumur setelah minum dan gunakan sedotan untuk meminimalkan kontak dengan gigi.\r\n\r\n3. Susu almond\r\nMasalah dengan alternatif susu sapi, seperti almond, oat, rami, kedelai, kelapa, dan susu beras, sering kali diproses dengan sangat baik dan memiliki banyak gula tambahan. Faktanya, susu nabati ini biasanya memiliki sedikit kandungan dari tanaman yang sebenarnya.\r\n\r\n\"Segelas susu almond rata-rata, misalnya, hanya memiliki sekitar empat buah almond\" ujar\r\nKeith Thomas Ayoob, EdD, RD, FAND, Profesor klinis asosiasi di Fakultas Kedokteran Albert Einstein. Inilah alasan Anda harus berhenti memberi susu non dairy pada anak.\r\n\r\n4. Teh hijau\r\nBanyak orang memilih minum teh hijau untuk membantu mencegah kanker, peradangan, dan penyakit jantung. Minum banyak teh hijau juga dapat mengganggu penyerapan zat besi dalam tubuh.\r\n\r\n\"Tanin yang ditemukan dalam teh hijau juga dapat mengganggu penyerapan zat besi non-heme (zat besi dari sumber nabati), jika Anda memiliki kadar zat besi yang rendah atau berisiko mengalami defisiensi zat besi (beberapa atlet, lansia, wanita hamil, dan vegetarian yang tidak mengonsumsi cukup zat besi) hindari minum teh hijau saat makan,\" ujar Ahli gizi, Lyssie dan Tammy Lakatos.\r\n\r\n', 'berita7.jpeg', '2020-11-11 14:06:26'),
(8, 'Positif Corona, Pengantin Baru Asal Sragen dan Orang Tuanya Meninggal', 'pengantin baru asal Desa Wonorejo, Kecamatan Kalijambe, Sragen, meninggal dalam kondisi positif terpapar virus Corona atau COVID-19. Tragisnya, hanya berselang beberapa hari, kedua orang tua L menyusul meninggal juga akibat terpapar COVID-19.\r\n\"Yang bersangkutan positif COVID-19. Meninggal tanggal 5 November di RSUD Moewardi. Ibunya meninggal tanggal 6 November dan ayahnya meninggal Senin kemarin (9 November). Orang tuanya juga positif,\" ujar Kepala Dinas Kesehatan Kabupaten (DKK) Sragen Hargiyanto, dihubungi detikcom, Selasa (10/11/2020).\r\n\r\nHargiyanto mengatakan, ibu L menjalani perawatan di RSUD Ngipang Solo. Sementara ayahnya dirawat di RSUD dr Soeratno Gemolong. Menurut Hargiyanto, kuat dugaan kedua orang tua tersebut terpapar Corona dari L.\r\n\r\n\"Dua-duanya kemungkinan terpapar dari anaknya. Sementara anaknya kemungkinan terpapar dari Jakarta karena bekerjanya di Jakarta,\" terangnya.', 'berita8.jpeg', '2020-11-11 14:11:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kamus`
--

CREATE TABLE `tb_kamus` (
  `id` int(11) NOT NULL,
  `istilah` varchar(10) NOT NULL,
  `kepanjangan` varchar(50) NOT NULL,
  `detailnya` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kamus`
--

INSERT INTO `tb_kamus` (`id`, `istilah`, `kepanjangan`, `detailnya`) VALUES
(1, 'AAA', 'Aneurisma Aorta Abdominalis', 'kondisi melebarnya aorta di bagian perut/abdominal, secara abnormal.'),
(2, 'ACS', 'Acute Coronary Syndrome', '(sindorm koroner akut) adalah kondisi dimana aliran darah menuju ke jantung berkurang secara tiba-tiba.'),
(3, 'AGD', 'Analsis Gas Darah', '(arterial blood gas /ABG) adalah pemeriksaan medis untuk mengukur jumlah oksigen, karbon dioksida dalam darah serta menentukan tingkat keasaman pH darah.'),
(4, 'AIS', 'Acute Ischemic Stroke', 'kondisi dimana pasokan darah ke otang terganggu akibat adanya penyumbatan.'),
(5, 'BUN', 'Blood Urea Nitrogen', '(nitrogen urea darah) ureum adalah produk limbah hasil metabolisme protein yang bersifat racun bagi tubuh. Nilai normal ureum berdasarkan usia; 0-5 tahun 5-18 mg/dL, 5-15 tahun 7-18 mg/dL dan >15 tahun 6-23 mg/dL'),
(6, 'CAD', 'Coronary Artery Disease ', '(penyakit arteri koroner) dimana plak menumpuk di dalam dinding arteri (pembuluh darah utama jantung).'),
(7, 'CHF', 'Congestive Heart Failure', '(gagal jantung kongesti) adalah kegagalan jantung dalam memompa pasokan darah yang dibutuhkan tubuh.'),
(8, 'CI', 'Cardiac Index', '(indeks jantung) adalah paramater hemodinak yang menghubungkan cardiac output (CO) dari ventirkel kiri dalam satu menit dengan luas permukaan tubuh (BSA), sehingga menghubungkan kinerja jantung'),
(9, 'CPIS', 'Clinical Pulmonary Infection Score', '(skor infeksi paru klini) adalah instrumen yang membantu dalam mendiagnosisi pneumonia terkait ventilator (VAP)'),
(10, 'CPR', 'Cardio-Pulmonary Resucitation', '(resusitas jantung paru/RJP adalah langkah pertolongan medis untuk mengembalikan fungsi napas atau sirkulasi darah yang berhenti. RJP bertujuan untuk menjaga oksigen tetap beredar ke seluruh tubuh.'),
(11, 'DKA', 'Diabetik Ketoasidosis', 'komplikasi diabtes mematikan yang disebabkan oleh tingginya produksi asam darah tubuh (keton)'),
(12, 'ICP', 'Intracranial Pressure', 'Tekanan Intrakranial adalah tekanan di dalam ruang tengkorak yang dinamis dan fluktiatif yang dipengaruhi oleh cairan serebrospinal, jaringan otak dan darah.'),
(13, 'LED', 'Laju Endap Darah', '(erytrocyte sedimentation rate, ESR) Tes LED yaitu tes untuk mengukur berapa lama waktu yang dibutuhkan untuk sel darah merah jatuh atau mengedap ke dasar tabung reaksi kaca. tes LED digunakan untuk menilai kondisi peradangan atau infeksi di tubuh.'),
(14, 'MRI', 'Magnetic Resonance Imaging', 'metode menghasilkan gambar organ yang lebih jelas, termasuk pemeriksaan tumor'),
(15, 'PCI', 'Percutaneous Coronary Intervention ', '(intervensi koroner akut) adalah prosedur intervensi non bedah dengan menggunakan kateter untuk melebarkan atau membuka pembuluh darah koroner yang menyempit dengan balon atau stent.'),
(16, 'PEA', 'Pulseless electrical activity', '(aktivitas listrik tanda nadi) adalah henti jantung di mana elektrokardiogram menunjukkan irama jantung yang seharusnya menghasilkan denyut nadi, tetapi tidak.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(125) NOT NULL,
  `email` varchar(125) NOT NULL,
  `full_name` text NOT NULL,
  `sex` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `tgl_daftar` varchar(50) NOT NULL,
  `gambar` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `email`, `full_name`, `sex`, `password`, `alamat`, `tgl_daftar`, `gambar`) VALUES
(14, 'apus3', 'akukan@gmail.com', 'iya kan lah', 'laki laki', '202cb962ac59075b964b07152d234b70', 'jakarta lah', '2020-11-12 16:09:00', 'ari123.jpg'),
(15, 'ari123', 'ari@gmail.com', 'Ari ramadhani', 'Laki-laki', '827ccb0eea8a706c4c34a16891f84e7b', 'cakung', '2020-11-12 16:11:57', 'ari123.jpg'),
(16, 'ardhani', 'jantan@gmail.com', 'jantan banar', 'Laki-laki', '827ccb0eea8a706c4c34a16891f84e7b', 'jakarta', '2020-11-12 16:15:36', 'ari123.jpg'),
(17, 'cowo', 'coco', 'cowo', 'Laki-laki', '827ccb0eea8a706c4c34a16891f84e7b', 'karta', '2020-11-13 16:58:53', 'ari123.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_berita`
--
ALTER TABLE `tb_berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indeks untuk tabel `tb_kamus`
--
ALTER TABLE `tb_kamus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_berita`
--
ALTER TABLE `tb_berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_kamus`
--
ALTER TABLE `tb_kamus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
