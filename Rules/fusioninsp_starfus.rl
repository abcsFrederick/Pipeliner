rule rule fusioninsp_starfus:
     input:  fusions="starfusion/{x}/star-fusion.fusion_candidates.final",file1="{x}.R1.trimmed.fastq.gz",file2="{x}.R2.trimmed.fastq.gz"
     output: "starfusion/fusioninspector/{x}/{x}.fusion_predictions.final"
     params: rname='fusioninsp',sample="{x}",starlib=config['references'][pfamily]['STARFUSIONLIB']
     shell: module load fusioninspector/1.0.1; mkdir starfusion/fusioninspector/{params.sample}; FusionInspector --fusions {input.fusions} --genome_lib {params.starlib} -i {input.file1},{input.file2} --out-dir starfusion/fusioninspector/{params.sample} --out_prefix {params.sample} --prep_for_IGV