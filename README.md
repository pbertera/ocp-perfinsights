# OpenShift PerfInsights

Executing the Microsoft Azure PerfInsights diagnostic tools on an OpenShift CoreOS node can be cumbersome.
This repo contains some facilities to help running the tools.

## Usage

This repo contains a containerized version of the [Linux PerfInsights tools](https://learn.microsoft.com/en-us/troubleshoot/azure/virtual-machines/how-to-use-perfinsights-linux).

### Directly on the nodes

You can execute the tools manually on the OCP node:

1. Log into the node via SSH or `oc debug/node $NODE`
2. Execute `chroot /host`
3. Clone the repo: `cd /tmp ; git clone https://github.com/pbertera/ocp-perfinsights.git ; cd ocp-perfinsights`
4. Run the tools: `./run.sh -d 10M -r quick -a -q -o /tmp/report/`

### Using a CronJob

With the CronJob you can run the Linux PerfInsights tools periodically on one or more nodes and collect the reports in a PV.
All the needed manifests are under the `manifests` folder, please review then before applying.

- `perfinsights-rbac.yaml` configures the RBAC in order to run a privileged pod
- `perfinsights-pvc.yaml` creates the PVC (adapt it to your needs)
- `perfinsights-cronjob.yaml` creates the CronJob, you may want to adjust the node selector, schedule and args.
- `perfinsights-consumer-pod.yaml` creates a dummy Pod mounting the volume so you can copy the reports
