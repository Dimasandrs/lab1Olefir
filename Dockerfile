FROM amazonlinux:2
COPY . /home/lab1
WORKDIR /home/lab1
CMD ["./mys.sh"]
