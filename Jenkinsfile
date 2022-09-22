@Library('global-jenkins-library@2.1.1') _

buildInfo = getBuildInfo()

def nativeImage = buildSimpleDocker_v3(
        buildInfo: buildInfo,
        dockerfileDir: baseDir,
        buildContext: baseDir,
        dockerImageRepositoryName: 'offchain-python-hello-world',
        visibility: 'docker.io'
)

buildSimpleDocker_v3(
        buildInfo: buildInfo,
        dockerfileDir: baseDir + '/gramine',
        buildContext: baseDir,
        dockerImageRepositoryName: 'tee-gramine-offchain-python-hello-world',
        visibility: 'iex.ec'
)

sconeBuildUnlocked(
        nativeImage: nativeImage,
        imageName: 'offchain-python-hello-world',
        imageTag: buildInfo.imageTag,
        sconifyArgsPath: baseDir + '/sconify.args',
        sconifyVersion: '5.7.1'
)
