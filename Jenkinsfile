@Library('global-jenkins-library@2.1.1') _

buildInfo = getBuildInfo()

def nativeImage = buildSimpleDocker_v2(
  buildInfo: buildInfo,
  dockerfileDir: 'offchain-computing',
  dockerImageRepositoryName: 'offchain-python-hello-world',
  imageprivacy: 'public'
)

sconeBuildUnlocked(
  nativeImage:     nativeImage,
  imageName:       'offchain-python-hello-world',
  imageTag:        buildInfo.imageTag,
  sconifyArgsPath: 'offchain-computing/sconify.args',
  sconifyVersion:  '5.7.1'
)
