library(HaploBlocker)

mhc <- read.csv("DRB1-3123.og.haplo.tsv", header = T, as.is = T, check.names = F, sep = "\t")
rownames(mhc) <- mhc$node.id
mhc <- mhc[,-1]

mhc_blocks <- block_calculation(mhc, window_size = 20, node_min = 3)
pdf("test")
plot_block(mhc_blocks)
dev.off()

mhc[1,4] <- NA
mhc[342, 4] <- NA
mhc[2500, 6] <- NA

mhc_blocks <- block_calculation(mhc, window_size = 20, node_min = 3)
plot_block(mhc_blocks)
## mhc_blocks <- block_calculation(mhc, window_size = 10, node_min = 5) DOES NOT WORK!
# mhc_blocks <- block_calculation(mhc, window_size = 10, node_min = 1)


Start_blockinfo_calculation
.........................Start_nodes_calculation
.........................Start_simple_merge: 996
Start_CrossMerging_full
Iteration 1 : 101 nodes
Iteration 2 : 18 nodes
Iteration 3 : 15 nodes
Start_IgnoreSmall
Iteration 1 : 15 nodes
Iteration 2 : 7 nodes
Start_Blockmerging
Iteration 1 : 7 blocks
Iteration 2 : 7 blocks
Iteration 3 : 2 blocks
Iteration 4 : 2 blocks
Start_Blockextending
Iteration 1 : 2 blocks;  0 block extensions

load("../../HaploBlocker/Data/KE_DH_chromo1.RData")
data_blocks <- block_calculation(data)

p53 <- read.csv("1000GP_p53_17_7571720-7590868.haps.og.haplos.tsv", header=T, as.is=T, check.names=F, sep="\t")
rownames(p53) <- p53$node.id
p53 <- p53[,-1]

p53_blocks <- block_calculation(p53)
pdf("p53_blocks")
plot_block(p53_blocks)
dev.off()

p53[1,4] <- NA
p53[342, 4] <- NA
p53[456, 6] <- NA

p53[500:1000, 500:1000] <- NA

p53_blocks <- block_calculation(p53)
pdf("p53_blocks_na")
plot_block(p53_blocks)
dev.off()

library(tidyverse)

yeast <- read.delim('seqwish_yeast_l10k.og.haps.tsv.gz')
rownames(yeast) <- yeast$node.id
yeast <- yeast[,-1]

yeast_blocks <- block_calculation(yeast, node_min = 2, edge_min = 2, window_size = 10, min_majorblock = 1)
pdf("yeast_blocks_window_size_10")
plot_block(yeast_blocks)
dev.off()
