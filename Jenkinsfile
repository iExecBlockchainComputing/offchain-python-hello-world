@Library('jenkins-library@1.0.4') _

def tasks = [:]
tasks["offchain"] = {
    stage ("Build Python Hello World"){
        def nativeImage = buildSimpleDocker_v2(dockerfileDir: 'offchain-computing',
                dockerImageRepositoryName: 'offchain-python-hello-world', imageprivacy: 'public')
        sconeBuildAllTee(nativeImage: nativeImage, targetImageRepositoryName: 'offchain-python-hello-world',
                sconifyArgsPath: 'offchain-computing/sconify.args')
    }
}
parallel tasks