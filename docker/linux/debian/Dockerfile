FROM debian:latest

RUN echo "before ---------"
RUN printenv
RUN echo "---------"

COPY ./sampleenv /sampleenv
RUN export MY_VARIABLE=$(cat /sampleenv)
#ENV MY_VARIABLE "aaaa"

RUN echo "after ---------"
RUN echo $MY_VARIABLE
RUN echo "---------"