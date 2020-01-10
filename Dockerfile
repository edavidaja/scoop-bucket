FROM mcr.microsoft.com/powershell
SHELL [ "powershell", "-command" ]

RUN Set-ExecutionPolicy RemoteSigned -scope CurrentUser
RUN iwr -useb get.scoop.sh | iex
RUN scoop install git
RUN git clone https://github.com/edavidaja/scoop-bucket

WORKDIR scoop-bucket

RUN .\bin\checkver.ps1 -App rstudio-daily -Update
