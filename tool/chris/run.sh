#!/bin/bash
rm -rf ../cwltool/*.pyc
../cwltool.py --outdir output/ --cachedir ./cache ./workflow/main.cwl ./workflow/job.yml
