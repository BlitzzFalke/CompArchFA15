vlog -reportprogress 300 -work work multiplexer.v decoder.v adder.v
vsim -voptargs="+acc" testFullAdder
add wave -position insertpoint  \
sim:/testFullAdder/carryin \
sim:/testFullAdder/a \
sim:/testFullAdder/b \
sim:/testFullAdder/carryout \
sim:/testFullAdder/sum 
run -all
wave zoom full
