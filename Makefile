clean:
	$(RM) *~ *.retry index.html*
	$(RM) -r __pycache__

vclean:
	vagrant destroy -f
