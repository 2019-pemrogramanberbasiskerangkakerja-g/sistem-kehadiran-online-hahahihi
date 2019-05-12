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
1. `POST /absen` Untuk melakukan absen [On Progress
- sent via body: pertemuan, id mahasiswa


2. `GET /rekap/:idmatkul` Untuk melihat rekap kuliah per semester

3. `GET /rekap/:idmatkul/:pertemuanke` untuk Melihat rekap kuliah per pertemuan

4. `GET /rekapmahasiswa/:nrp/:idmatkul` untuk Melihat rekap per mahasiswa per matkul

5. `GET /rekapmahasiswasemester/:nrp/:idsemester` untuk Melihat rekap per mahasiswa per semester [On Progress]

6. `POST /tambahmahasiswa` Untuk menambah data mahasiswa
- sent via body: nrp, nama, password, idmatkul

7. `POST /tambahpeserta/IDMatkul/NRP` Untuk menambah peserta ke mata kuliah dan kelas tertentu [On Progress]
- sent via body: nrp, nama, password, idmatkul

8. `POST /tambahmatkul` Untuk menambah data mata kuliah dan kelas
- sent via body: IDMatkul, nama matakuliah, jumlah pertemuan, kelas, semester

9. `POST /tambahjadwal` Untuk menambah jadwal kelas
- sent via body: IDMatkul, pertemuan ke, jam_mulai, jam_selesai, ruangan


Desain Database

![db](Database.png)


