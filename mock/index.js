const heroResponse = Mock.loadModule('./chess.json').data
const jobResponse = Mock.loadModule('./job.json').data
const raceResponse = Mock.loadModule('./race.json').data
const equipResponse = Mock.loadModule('./equip.json').data

Mock.mock(/auth\/login/, {
    code: 200,
    data: {
        token: '123123123',
        result: 'result12312'
    }
})

Mock.mock(/heroList/, {
    code: 200,
    data: heroResponse
})

Mock.mock(/heroDetail/, (ctx) => {
    const {id} = ctx.query
    let chess = heroResponse.find(chess => chess.TFTID === id)
    if (chess) {
        let {jobs, races} = chess
        jobs = jobs.split(',')
        races = races.split(',')

        ctx.body = {
            code: 200,
            data: {
                chess,
                jobs: jobResponse.filter(job => jobs.includes(job.name)),
                races: raceResponse.filter(race => races.includes(race.name))
            }
        }
    } else {
        ctx.body = {
            code: 400,
            msg: 'not found'
        }
    }

})
