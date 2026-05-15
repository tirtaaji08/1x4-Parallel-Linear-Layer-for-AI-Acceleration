# 1x4-Parallel-Linear-Layer-for-AI-Acceleration

## Deskripsi Proyek
Repositori ini, berisi rancangan sebuah lapisan linear (Linear Layer) berukuran 1x4 yang mendemonstrasikan konsep Parallel Processing dan Data Broadcasting pada tingkat perangkat keras (FPGA).

Desain ini mensimulasikan bagaimana akselerator AI (seperti NPU atau TPU) mengeksekusi banyak operasi Multiply-Accumulate (MAC) secara bersamaan dalam satu siklus clock, jauh lebih efisien dibandingkan pemrosesan sekuensial pada CPU konvensional.

## Fitur Utama
1. Hardware Parallelism: Melakukan 4 operasi perhitungan neuron (MAC + ReLU) secara serentak dalam satu waktu.
2. Data Broadcasting: Menerapkan arsitektur di mana satu aliran data input didistribusikan (di-broadcast) ke 4 processing elements secara bersamaan untuk meminimalkan bottleneck memori.
3. Resource Efficiency: Menggunakan format Q8.8 Fixed-Point Arithmetic untuk menghemat penggunaan area logic pada FPGA.

## Arsitektur Sistem
1. Input: 1 Data Input (16-bit Q8.8) yang dibagikan ke semua neuron.
2. Weights: 4 Data Bobot independen (W0, W1, W2, W3) untuk masing-masing neuron.
3. Output: 4 Hasil komputasi independen (Out0, Out1, Out2, Out3) yang telah melewati fungsi aktivasi ReLU.

## Testbench
1. Inisialisasi Bobot: W0 = 1.0, W1 = 0.5, W2 = -1.0, W3 = 2.0.
2. Siklus Pertama (Input = 2.0): Sistem berhasil mengeluarkan hasil N0 = 2.0, N1 = 1.0, N2 = 0.0 (terpotong oleh ReLU karena hasil aslinya negatif), dan N3 = 4.0 secara bersamaan.
3. Siklus Kedua (Input = 1.0): Sistem berhasil mengakumulasikan nilai baru dengan nilai sebelumnya tanpa kehilangan presisi.

Output Waveform:

<img width="888" height="341" alt="Image" src="https://github.com/user-attachments/assets/146bfbb6-6460-4f32-b2ec-28279c372a75" />

   
