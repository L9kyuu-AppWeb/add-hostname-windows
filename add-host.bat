@echo off
setlocal

:: Tentukan lokasi file hosts
set hostfile=%SystemRoot%\System32\drivers\etc\hosts

:: Tampilkan isi file hosts sebelum meminta input
echo Isi file hosts saat ini:
type %hostfile%
echo.

:: Meminta input dari pengguna
set /p ip_address=Masukkan IP Address: 
set /p hostname=Masukkan Hostname: 

:: Cek apakah hostname sudah ada di file hosts
findstr /C:"%hostname%" %hostfile% >nul

if %errorlevel% equ 0 (
    echo Hostname %hostname% sudah ada, memvalidasi IP...
    :: Jika hostname sudah ada, cek apakah IP-nya sesuai
    for /f "tokens=1,2 delims= " %%a in ('findstr /C:"%hostname%" %hostfile%') do (
        if "%%a" neq "%ip_address%" (
            echo IP berbeda, memperbarui IP...
            :: Hapus entri lama
            powershell -Command "(Get-Content '%hostfile%') | Where-Object { $_ -notmatch '%hostname%' } | Set-Content '%hostfile%'"
            :: Tambahkan entri baru dengan IP yang diperbarui
            echo %ip_address%    %hostname% >> %hostfile%
            echo IP berhasil diperbarui menjadi %ip_address%.
        ) else (
            echo IP sudah sesuai, tidak ada perubahan.
        )
    )
) else (
    :: Jika hostname belum ada, tambahkan entri baru
    echo Menambahkan hostname baru...
    echo %ip_address%    %hostname% >> %hostfile%
    echo Hostname %hostname% berhasil ditambahkan dengan IP %ip_address%.
)

pause
