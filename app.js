var express = require('express'); 
var bodyParser = require("body-parser"); 
var app = express(); 
app.use(bodyParser.json()); 
app.use(bodyParser.urlencoded({ extended: true })); 
const port = 8000; 
var mysql = require('mysql'); 
var con = mysql.createConnection({ 
host : 'localhost', 
user : 'root', 
password : 'password', 
database : 'tugas5pbkk' 
}); 

app.post('/tambahmatkul', function (req, res) { 
if(req.body.nama == null || req.body.semester == null || req.body.kelas == null){ 
res.send({status : "gagal", pesan : "data ada yang tidak lengkap", isi_data : req.body }); 
} 
con.connect(function(err) { 
if (err) throw err; 
console.log("Connected!"); 
var sql = "INSERT INTO matakuliah (nama, jumlah_pertemuan, semester, kelas) VALUES ?"; 
var values = [ 
[req.body.nama, 16, req.body.semester, req.body.kelas] 
]; 
con.query(sql, [values], function (err, result) { 
if (err) throw err; 
console.log("data berhasil masuk"); 
}); 
}); 
res.send({status : "sukses", pesan : "data berhasil masuk", isi_data : req.body }); 
}); 

app.post('/tambahjadwal', function (req, res) { 
if(req.body.pertemuan == null || req.body.jam_mulai == null || req.body.jam_selesai == null || req.body.ruangan == null || req.body.matakuliah_id == null){ 
res.send({status : "gagal", pesan : "data ada yang tidak lengkap", isi_data : req.body }); 
} 
con.connect(function(err) { 
if (err) throw err; 
console.log("Connected!"); 
var sql = "INSERT INTO pertemuan_matakuliah (pertemuan, jam_mulai, jam_selesai, ruangan, matakuliah_id) VALUES ?"; 
var values = [ 
[req.body.pertemuan, req.body.jam_mulai, req.body.jam_selesai, req.body.ruangan, req.body.matakuliah_id] 
]; 
con.query(sql, [values], function (err, result) { 
if (err) throw err; 
console.log("data berhasil masuk"); 
}); 
}); 
res.send({status : "sukses", pesan : "data berhasil masuk", isi_data : req.body }); 
}); 

app.post('/tambahmahasiswa', function (req, res) { 
if(req.body.nama == null || req.body.nrp == null || req.body.password == null || req.body.matakuliah_id == null){ 
res.send({status : "gagal", pesan : "data ada yang tidak lengkap", isi_data : req.body }); 
} 
con.connect(function(err) { 
if (err) throw err; 
console.log("Connected!"); 
var sql = "INSERT INTO mahasiswa (nrp, nama, password, matakuliah_id) VALUES ?"; 
var values = [ 
[req.body.nrp, req.body.nama, req.body.password, req.body.matakuliah_id] 
]; 
con.query(sql, [values], function (err, result) { 
if (err) throw err; 
console.log("data berhasil masuk"); 
}); 
}); 
res.send({status : "sukses", pesan : "data berhasil masuk", isi_data : req.body }); 
}); 

app.post('/absen', function (req, res) { 
if(req.body.mahasiswa_id == null || req.body.pertemuan == null){ 
res.send({status : "gagal", pesan : "data ada yang tidak lengkap", isi_data : req.body }); 
} 
con.connect(function(err) { 
if (err) throw err; 
console.log("Connected!"); 
var sql = "INSERT INTO absensi (mahasiswa_id, pertemuan) VALUES ?"; 
var values = [ 
[req.body.mahasiswa_id, req.body.pertemuan] 
]; 
con.query(sql, [values], function (err, result) { 
if (err) throw err; 
console.log("data berhasil masuk"); 
}); 
}); 
res.send({status : "sukses", pesan : "absen berhasil masuk", isi_data : req.body }); 
}); 

app.get('/rekap/:id_matkul', function (req, res) { 
con.connect(function(err) { 
if (err) throw err; 
con.query("SELECT * FROM mahasiswa WHERE matakuliah_id = '"+req.params.id_matkul+"'", function (err, result) { 
if (err) throw err; 
res.send({status : "sukses", pesan : "rekap peserta mata kuliah :", isi_data : result }); 
}); 
}); 
}); 

app.get('/rekap/:id_matkul/:pertemuan', function (req, res) { 
con.connect(function(err) { 
if (err) throw err; 
con.query("SELECT * FROM absensi WHERE pertemuan = "+req.params.pertemuan+" AND mahasiswa_id IN (SELECT id FROM mahasiswa WHERE matakuliah_id = "+req.params.id_matkul+")" , function (err, result) { 
if (err) throw err; 
res.send({status : "sukses", pesan : "rekap peserta mata kuliah :", isi_data : result }); 
}); 
}); 
}); 

app.get('/rekapmahasiswasemester/:nrp/:id_semester', function (req, res) { 
con.connect(function(err) { 
if (err) throw err; 
con.query("SELECT * FROM absensi WHERE mahasiswa_id IN (SELECT id FROM mahasiswa WHERE nrp = "+req.params.nrp+")" , function (err, result) { 
if (err) throw err; 
res.send({status : "sukses", pesan : "rekap peserta mata kuliah :", isi_data : result }); 
}); 
}); 
}); 

app.get('/rekapmahasiswa/:nrp/:id_matkul', function (req, res) { 
con.connect(function(err) { 
if (err) throw err; 
con.query("SELECT * FROM absensi WHERE mahasiswa_id IN (SELECT id FROM mahasiswa WHERE nrp = "+req.params.nrp+")" , function (err, result) { 
if (err) throw err; 
res.send({status : "sukses", pesan : "rekap peserta mata kuliah :", isi_data : result }); 
}); 
}); 
}); 

app.listen(port, () => console.log(`app listening on port ${port}!`));