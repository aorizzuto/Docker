FROM busybox:1.24
#RUN ls
#RUN touch ale.txt
#RUN ls

# To reduce image layers we can use:
RUN ls && touch ale.txt && ls

CMD echo "This is the command when we run the image"
