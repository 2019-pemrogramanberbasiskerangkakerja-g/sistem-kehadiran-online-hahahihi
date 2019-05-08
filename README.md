# Pemrograman Berbasis Kerangka Kerja
## Kelompok 5
## Tugas Sistem Kehadiran Online
   
   - **Naufal Pranasetyo   05111540000057**
   - **Muhammad Akram A.   05111540000050**
   - **Hilmi Raditya P.    05111640000164**

Tools yang digunakan: 
- [expressJS](https://expressjs.com/)
- [MongoDB](https://www.mongodb.com/) 
   
## Cara Menjalankan:
1. Clone repository ini, buka folder dan masuk terminal
2. Jalankan `npm install express --save`
3. Jalankan `npm install`
4. Nyalakan server MongoDB, jalankan `node index.js`
5. Buka browser menuju ke halaman http://localhost:8000
6. Buka terminal untuk melihat log saat gagal dan berhasil login


## List API
1. POST /absen Untuk melakukan absen
- sent via body: idmahasiswa, pertemuan


2. POST /tambahmahasiswa Untuk menambah data mahasiswa
- sent via body: nrp, nama, password, idmatkul


3. POST /tambahpeserta/IDMatkul/NRP Untuk menambah peserta ke mata kuliah dan kelas tertentu [On Progress]
- sent via body: nrp, nama, password, idmatkul


4. POST /tambahmatkul Untuk menambah data mata kuliah dan kelas
- sent via body: IDMatkul, nama matakuliah, jumlah pertemuan, kelas, semester

5. POST /tambahjadwal Untuk menambah jadwal kelas
- sent via body: IDMatkul, pertemuan ke, jam_mulai, jam_selesai, ruangan

6. GET /rekap/:idmatkul Melihat rekap kuliah per semester

7. GET /rekap/:idmatkul/:pertemuanke Melihat rekap kuliah per pertemuan

8. GET /rekapmahasiswa/:nrp/:idmatkul Melihat rekap per mahasiswa per matkul

9. GET /rekapmahasiswa/:nrp/:idsemester Melihat rekap per mahasiswa per semester [On Progress]

Desain Database

![db](Database.png)


