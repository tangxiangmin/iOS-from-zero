const heroResponse = Mock.loadModule('./chess.json')

Mock.mock(/auth\/login/, {
    code: 200,
    data: {
        token: '123123123',
        result: 'result12312'
    }
})

Mock.mock(/heroList/, heroResponse)